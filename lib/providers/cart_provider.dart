import 'package:flutter/material.dart';
import '../models/product.dart';
import 'dart:collection';

class CartItem {
  final Product product;
  int quantity;
  CartItem({required this.product, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  UnmodifiableMapView<String, CartItem> get items =>
      UnmodifiableMapView(_items);

  int get itemCount => _items.length;

  double get total {
    double sum = 0;
    _items.forEach((k, v) {
      sum += v.product.price * v.quantity;
    });
    return sum;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += 1;
    } else {
      _items[product.id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  void removeSingle(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId]!.quantity > 1) {
      _items[productId]!.quantity -= 1;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void updateQuantity(String productId, int qty) {
    if (!_items.containsKey(productId)) return;
    if (qty <= 0) {
      _items.remove(productId);
    } else {
      _items[productId]!.quantity = qty;
    }
    notifyListeners();
  }
}
