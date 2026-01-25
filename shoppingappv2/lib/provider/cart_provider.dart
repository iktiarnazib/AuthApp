import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingappv2/models/product.dart';

// Notifier ক্লাস যা স্টেট ম্যানেজ করবে
class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    state = {...state, product};
    debugPrint('Cart Size: ${state.length}');
  }

  void removeProduct(Product product) {
    state = state.where((e) => e.name != product.name).toSet();
    debugPrint('Cart Size: ${state.length}');
  }
}

final cartProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

final cartTotalProvider = Provider<double>((ref) {
  final cartProducts = ref.watch(cartProvider);

  double productTotal = 0;
  for (Product product in cartProducts) {
    productTotal += product.price;
  }

  return productTotal;
});
