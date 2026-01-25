import 'package:flutter/material.dart';
import 'package:shoppingappv2/widgets/mydrawer.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Louis Vuitton'),
      ),
      body: Center(
        child: Text(
          'This is Shop Page!',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
