import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _quantities = {};

  final List<ProductModel> _items = [];

  List<ProductModel> get items => _items;

  int getQuantity(ProductModel product) {
    return _quantities[product.id] ?? 0;
  }

  void addToCart(ProductModel product) {
    if (!_items.contains(product)) {
      _items.add(product);
    }

    _quantities[product.id] =
        (_quantities[product.id] ?? 0) + 1;

    notifyListeners();
  }

  void increaseQuantity(ProductModel product) {
    _quantities[product.id] =
        (_quantities[product.id] ?? 0) + 1;

    notifyListeners();
  }

  void decreaseQuantity(ProductModel product) {
    final currentQuantity = _quantities[product.id] ?? 0;

    if (currentQuantity > 1) {
      _quantities[product.id] = currentQuantity - 1;
    } else {
      _quantities.remove(product.id);
      _items.remove(product);
    }

    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _quantities.remove(product.id);
    _items.remove(product);

    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (final product in _items) {
      total += product.price * getQuantity(product);
    }

    return total;
  }
}