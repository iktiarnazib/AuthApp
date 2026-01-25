import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingappv2/provider/cart_provider.dart';
import 'package:shoppingappv2/provider/products_provider.dart';
import 'package:shoppingappv2/widgets/mydrawer.dart';
import 'package:shoppingappv2/widgets/product_widget.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});

  @override
  ConsumerState<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);
    // final cartProduct = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Louis Vuitton'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget(
                  name: products[index].name,
                  price: products[index].price,
                  description: products[index].description,
                  image: products[index].imagePath,
                  onTap: () {
                    ref.read(cartProvider.notifier).addProduct(products[index]);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 300),
        ],
      ),
      drawer: Mydrawer(),
    );
  }
}
