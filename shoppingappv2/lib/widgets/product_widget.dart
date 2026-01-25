import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final double price;
  final String description;
  final String image;
  final Function()? onTap;
  const ProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Image.asset(image, height: 180),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('\$$price'),
          Text(description),
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              color: Colors.blue,
              child: Text('Add to cart'),
            ),
          ),
        ],
      ),
    );
  }
}
