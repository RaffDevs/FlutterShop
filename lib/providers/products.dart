import 'package:flutter/foundation.dart';
import 'package:shop/mock/dummy_data.dart';
import 'package:shop/models/product.dart';

class Products with ChangeNotifier {

  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];

  List<Product> get getFavoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }
  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  // bool _showFavoriteOnly = false;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}