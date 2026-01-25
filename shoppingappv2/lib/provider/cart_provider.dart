import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoppingappv2/models/product.dart';

// Notifier ক্লাস যা স্টেট ম্যানেজ করবে
class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {}; // প্রাথমিক স্টেট হিসেবে খালি সেট রিটার্ন করছে
  }

  void addProduct(Product product) {
    // ইমিউটেবলি স্টেট আপডেট করা হচ্ছে
    state = {...state, product};
    debugPrint('কার্ট সাইজ: ${state.length}');
  }

  void removeProduct(Product product) {
    state = state.where((e) => e.name != product.name).toSet();
    debugPrint('কার্ট সাইজ: ${state.length}');
  }
}

// ম্যানুয়াল নটিফায়ার প্রোভাইডার
final cartProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

// ২. ডিপেন্ডেন্ট প্রোভাইডার (কার্ট টোটাল ক্যালকুলেশন)
final cartTotalProvider = Provider<double>((ref) {
  // cartProvider-কে ওয়াচ করা হচ্ছে, যাতে কার্টে কিছু যোগ হলে এটি অটো আপডেট হয়
  final cartProducts = ref.watch(cartProvider);

  double productTotal = 0;
  for (Product product in cartProducts) {
    productTotal += product.price;
  }

  return productTotal;
});
