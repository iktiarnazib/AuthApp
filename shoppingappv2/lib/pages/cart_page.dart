import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingappv2/provider/cart_provider.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Cart Page')),
      body: Column(
        children: [
          Column(
            children: cartProducts.map((product) {
              return Row(
                children: [
                  Image.asset(product.imagePath, height: 40, width: 40),
                  Text(product.name),
                  Expanded(child: SizedBox()),
                  Text('\$${product.price}'),
                  IconButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).removeProduct(product);
                    },
                    icon: Icon(Icons.delete, color: Colors.grey[900]),
                  ),
                ],
              );
            }).toList(),
          ),
          Divider(color: Colors.blue),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              children: [
                Text('Your total is: '),
                Expanded(child: SizedBox()),
                Text('$cartTotal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
