import 'package:flutter/material.dart';

class Mylisttile extends StatelessWidget {
  final String title;
  final IconData icons;
  final Function()? onTap;
  const Mylisttile({
    super.key,
    required this.title,
    required this.icons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Icon(icons), title: Text(title), onTap: onTap);
  }
}
