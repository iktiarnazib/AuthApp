import 'package:flutter/material.dart';
import 'package:shoppingappv2/pages/cart_page.dart';
import 'package:shoppingappv2/pages/intro_page.dart';
import 'package:shoppingappv2/pages/shop_page.dart';
import 'package:shoppingappv2/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        'introPage': (context) => const IntroPage(),
        'shopPage': (context) => const ShopPage(),
        'cartPage': (context) => const CartPage(),
      },
      home: IntroPage(),
    );
  }
}
