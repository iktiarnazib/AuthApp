import 'package:flutter/material.dart';
import 'package:shoppingappv2/pages/shop_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Center(child: Image.asset('assets/images/logo.png', height: 200)),
          SizedBox(height: 15),
          //title
          Text(
            'Luxury That Lasts a Lifetime.',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          SizedBox(height: 20),
          //button
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: FilledButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'shopPage');
              },
              child: Text('Shop Now'),
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
