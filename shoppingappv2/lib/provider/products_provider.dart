import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingappv2/models/product.dart';

List<Product> productList = [
  Product(
    name: 'Product 1',
    price: 99.9,
    description: 'Product 1 description',
    imagePath: 'assets/images/shoe.png',
  ),
  Product(
    name: 'Product 1',
    price: 99.9,
    description: 'Product 1 description',
    imagePath: 'assets/images/shoe.png',
  ),
  Product(
    name: 'Product 1',
    price: 99.9,
    description: 'Product 1 description',
    imagePath: 'assets/images/shoe.png',
  ),
  Product(
    name: 'Product 1',
    price: 99.9,
    description: 'Product 1 description',
    imagePath: 'assets/images/shoe.png',
  ),
  Product(
    name: 'Product 1',
    price: 99.9,
    description: 'Product 1 description',
    imagePath: 'assets/images/shoe.png',
  ),
  Product(
    name: 'Product 1',
    price: 99.9,
    description: 'Product 1 description',
    imagePath: 'assets/images/shoe.png',
  ),
];

final productProvider = Provider<List<Product>>((ref) {
  return productList;
});
