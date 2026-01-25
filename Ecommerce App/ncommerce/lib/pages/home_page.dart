import 'package:flutter/material.dart';
import 'package:ncommerce/components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/applelogo.png', height: 30, width: 30),
            SizedBox(width: 5),
            Text('Apple'),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(),
    );
  }
}
