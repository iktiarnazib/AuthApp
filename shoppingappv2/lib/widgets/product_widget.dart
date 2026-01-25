import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final double price;
  final String description;
  final String image;
  const ProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Image.asset(image),
          Text(name),
          Text('$price'),
          Text(description),
        ],
      ),
    );
  }
}
