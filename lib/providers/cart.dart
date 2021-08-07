import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get cartItems {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmout {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (findItem) => CartItem(
              id: findItem.id,
              productId: findItem.productId,
              title: findItem.title,
              price: findItem.price,
              quantity: findItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
              id: Random().nextDouble().toString(),
              productId: product.id,
              title: product.title,
              price: product.price,
              quantity: 1));
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.quantity,
    @required this.price
  });
}
