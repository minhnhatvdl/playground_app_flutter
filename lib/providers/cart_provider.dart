import 'package:flutter/material.dart';
import './category_provider.dart';

class CartProvider with ChangeNotifier {
  final List<CategoryProvider> cart = [];

  int get cartLength => cart.length;

  void addCart(CategoryProvider category) {
    cart.add(category);
    notifyListeners();
  }
}