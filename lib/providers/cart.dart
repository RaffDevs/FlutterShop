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

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (findItem) => CartItem(
          id: findItem.id,
          title: findItem.title,
          price: findItem.price,
          quantity: findItem.quantity + 1
        )
      );
    } else {
      _items.putIfAbsent(product.id, 
      () => CartItem(
        id: Random().nextDouble().toString(),
        title: product.title,
        price: product.price,
        quantity: 1
      ));
    }

    notifyListeners();
  }
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}
