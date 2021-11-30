import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  late Map<String, CartModel> _listCart = {};
  Map<String, CartModel> get listCart => _listCart;

  late Map<String, CartModel> _listCheckCart = {};
  Map<String, CartModel> get listCheckCart => _listCheckCart;

  int get cartCount => _listCart.length;

  int get totalAmount {
    int _total = 0;
    _listCheckCart.forEach((key, cart) {
      _total += cart.price * cart.quantity;
    });
    return _total;
  }

  void reloadCheckCart() {
    _listCheckCart = {};
    // notifyListeners();
  }

  void addToCart(
    String categoryId,
    String title,
    String imageUrl,
    int price,
    int quantity,
  ) {
    if (_listCart.containsKey(categoryId)) {
      //change quantity
      _listCart.update(
        categoryId,
        (category) => CartModel(
          id: categoryId,
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
          id: categoryId,
          title: title,
          imageUrl: imageUrl,
          price: price,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void removeToCart(String categoryId) {
    _listCart.removeWhere((key, category) => category.id == categoryId);
    notifyListeners();
  }

  void addToCheckCart(String idCategory) {
    _listCheckCart.putIfAbsent(idCategory, () => _listCart[idCategory]!);
    notifyListeners();
  }

  void removeCheckCart(String idCategory) {
    _listCheckCart.removeWhere((key, category) => key == idCategory);
    notifyListeners();
  }

  void changeQuantityCategory({
    String? idCategory,
    int? quantity,
  }) {
    _listCart.update(
      idCategory!,
      (category) => CartModel(
        id: category.id,
        title: category.title,
        price: category.price,
        imageUrl: category.imageUrl,
        quantity: quantity!,
      ),
    );

    notifyListeners();
  }

  void removeCategoriesInCartWhenCheckOut() {
    _listCheckCart.forEach(
      (keyCheckCart, value) =>
          _listCart.removeWhere((key, value) => key == keyCheckCart),
    );

    notifyListeners();
  }
}
