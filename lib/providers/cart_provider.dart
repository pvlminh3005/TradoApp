import 'package:flutter/material.dart';
import '/models/category_model.dart';
import '/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  late Map<String, CartModel> _listCart = {};
  Map<String, CartModel> get listCart => _listCart;

  List<CartModel> _listCheckCart = [];
  List<CartModel> get listCheckCart => _listCheckCart;

  //when pay categories in cart, app auto create bill orders to salers
  late Map<String, List<CartModel>> _listToCreateSaleOrders = {};
  Map<String, List<CartModel>> get listToCreateSaleOrders =>
      _listToCreateSaleOrders;

  int get cartCount => _listCart.length;

  int get totalAmount {
    int _total = 0;
    _listCheckCart.forEach((cart) {
      _total += cart.category!.price * cart.category!.quantity;
    });
    return _total;
  }

  void reloadCheckCart() {
    _listCheckCart = [];
    _listToCreateSaleOrders = {};
  }

  void addToCart(
    String categoryId,
    CategoryModel product,
    int price,
    int quantity,
  ) {
    if (_listCart.containsKey(categoryId)) {
      //change quantity
      _listCart.update(
        categoryId,
        (category) => CartModel(
          id: categoryId,
          idUser: category.idUser,
          category: CategoryModel(
            id: categoryId,
            idUser: product.idUser,
            title: product.title,
            price: price,
            quantity: product.quantity + quantity,
            imageUrl: product.imageUrl,
          ),
        ),
      );
    } else {
      //add new to cart
      _listCart.putIfAbsent(
        categoryId,
        () => CartModel(
          id: categoryId,
          idUser: product.idUser,
          category: CategoryModel(
            id: categoryId,
            idUser: product.idUser,
            title: product.title,
            price: price,
            quantity: quantity,
            imageUrl: product.imageUrl,
          ),
        ),
      );
    }
    notifyListeners();
  }

  void removeToCart(String categoryId) {
    _listCart.removeWhere((key, category) => category.id == categoryId);
    notifyListeners();
  }

  //add to checkcart <==> create bill
  void addToCheckCart(String idCategory) {
    _listCheckCart.add(_listCart[idCategory]!);

    String key = _listCart[idCategory]!.idUser!;
    if (_listToCreateSaleOrders.containsKey(key)) {
      _listToCreateSaleOrders.update(
        key,
        (value) {
          value.add(_listCart[idCategory]!);
          return value;
        },
      );
    } else {
      _listToCreateSaleOrders.putIfAbsent(
        key,
        () {
          return [_listCart[idCategory]!];
        },
      );
    }

    notifyListeners();
  }

  void removeCheckCart(String idCategory) {
    _listCheckCart.removeWhere((cart) => cart.category!.id == idCategory);
    notifyListeners();
  }

  void changeQuantityCategory({
    String? idCategory,
    int? quantity,
  }) {
    _listCart.update(
      idCategory!,
      (cart) => CartModel(
        id: cart.id,
        idUser: cart.idUser,
        category: CategoryModel(
          id: cart.category!.id,
          idUser: cart.category!.idUser,
          price: cart.category!.price,
          quantity: quantity!,
          imageUrl: cart.category!.imageUrl,
        ),
      ),
    );

    notifyListeners();
  }

  void removeCategoriesInCartWhenCheckOut() {
    _listCheckCart = [];
    _listToCreateSaleOrders = {};

    notifyListeners();
  }
}
