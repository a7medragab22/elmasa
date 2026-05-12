import 'package:elmasa/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';

class FavouritesManager extends ChangeNotifier {
  FavouritesManager._();
  static final FavouritesManager instance = FavouritesManager._();

  final List<Product> _items = [];
  List<Product> get items => List.unmodifiable(_items);

  bool isFavourite(String productId) {
    return _items.any((item) => item.id == productId);
  }

  void toggleFavourite(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  int get totalItems => _items.length;
}
