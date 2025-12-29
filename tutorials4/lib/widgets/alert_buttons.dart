import 'package:flutter/material.dart';

class AlertButtons extends StatelessWidget {
  final String title;
  VoidCallback onPressed;
  AlertButtons({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(backgroundColor: Colors.amber[800]),
      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }
}
