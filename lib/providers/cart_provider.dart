import 'package:flutter/material.dart';
import '../models/cart_model.dart';

enum CartQuantityType { increase, decrease }

class CartProvider with ChangeNotifier {
  late Map<String, CartModel> _listCart = {};
  Map<String, CartModel> get listCart => _listCart;

  late Map<String, CartModel> _listCheckCart = {};
  Map<String, CartModel> get listCheckCart => _listCheckCart;

  int get cartCount => _listCart.length;

  double get totalAmount {
    double _total = 0.0;
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
    double price,
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

  void addToCheckCart(String idCategory, CartModel cart) {
    if (_listCheckCart.containsKey(idCategory)) {
      //change quantity
      _listCart.update(
        idCategory,
        (category) => CartModel(
          id: idCategory,
          title: category.title,
          price: category.price,
          imageUrl: category.imageUrl,
          quantity: category.quantity,
        ),
      );
    } else {
      //add new to cart
      _listCheckCart.putIfAbsent(
        idCategory,
        () => CartModel(
          id: cart.id,
          title: cart.title,
          imageUrl: cart.imageUrl,
          price: cart.price,
          quantity: cart.quantity,
        ),
      );
    }
    notifyListeners();
  }

  void removeCheckCart(String idCategory) {
    _listCheckCart.removeWhere((key, category) => category.id == idCategory);
    notifyListeners();
  }

  void changeQuantityCategory(String idCategory, CartQuantityType type) {
    print(idCategory);
    if (_listCart.containsKey(idCategory)) {
      switch (type) {
        case CartQuantityType.increase:
          _listCart.update(
            idCategory,
            (category) => CartModel(
              id: category.id,
              title: category.title,
              price: category.price,
              imageUrl: category.imageUrl,
              quantity: category.quantity + 1,
            ),
          );
          break;
        default:
          _listCart.update(
            idCategory,
            (category) => CartModel(
              id: category.id,
              title: category.title,
              price: category.price,
              imageUrl: category.imageUrl,
              quantity: category.quantity - 1,
            ),
          );
          break;
      }
    }

    notifyListeners();
  }
}
