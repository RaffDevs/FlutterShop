import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shop/providers/cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> items;
  final DateTime date;

  Order({
    this.id,
    this.total,
    this.items,
    this.date
  });

}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get items {
    return [..._orders];
  }

  int get orderCount {
    return _orders.length;
  }

  void addOrder(Cart cart) {
    _orders.insert(0, Order(
      id: Random().nextDouble().toString(),
      total: cart.totalAmout,
      date: DateTime.now(),
      items: cart.cartItems.values.toList()
    ));
    
    notifyListeners();
  }
}

