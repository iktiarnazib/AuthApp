import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey[800],
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.shopping_bag, text: 'Cart'),
        ],
      ),
    );
  }
}
