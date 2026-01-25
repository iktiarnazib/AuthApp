import 'package:flutter/material.dart';
import 'package:ncommerce/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void introButtonPressed() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shown', true);

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            //image
            Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Image.asset('assets/images/applelogo.png', height: 250),
            ),

            //space

            //title
            Text(
              'Privacy is everything',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            //subtitle
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Make your life private with apple, purchase of privacy is now within your grasp!',
                style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
            ),

            //button
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[900],
                  ),
                  child: Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  introButtonPressed();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
