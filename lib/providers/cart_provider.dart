import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  late Map<String, CartModel> _listCart = {};
  Map<String, CartModel> get listCart => _listCart;

  int get cartCount => _listCart.length;

  void addToCart(String categoryId, String title, String imageUrl, double price,
      int quantity) {
    if (_listCart.containsKey(categoryId)) {
      //change quantity
      _listCart.update(
        categoryId,
        (category) => CartModel(
          id: category.id,
          title: category.title,
          price: category.price,
          imageUrl: category.imageUrl,
          quantity: category.quantity + quantity,
        ),
      );
    } else {
      //add new to cart
      _listCart.putIfAbsent(
        categoryId,
        () => CartModel(
          id: DateTime.now().toString(),
          title: title,
          imageUrl: imageUrl,
          price: price,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleCategory(String categoryId, int quantity) {
    if (!_listCart.containsKey(categoryId)) {
      //none of cart
      return;
    }
    if (_listCart[categoryId]!.quantity > 1) {
      _listCart.update(
        categoryId,
        (category) => CartModel(
          id: category.id,
          title: category.title,
          price: category.price,
          imageUrl: category.imageUrl,
          quantity: category.quantity - quantity,
        ),
      );
    } else {
      //quantity == 0
      _listCart.remove(categoryId);
    }
    notifyListeners();
  }

  void removeToCart(String categoryId) {
    _listCart.removeWhere((key, category) => category.id == categoryId);
    notifyListeners();
  }
}
