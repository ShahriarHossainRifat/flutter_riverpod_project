import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {
      Product(
        id: '2',
        title: 'Karati Kit',
        price: 34,
        image: 'assets/products/karati.png',
      ),
    };
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
