import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/order_detail_model.dart';

class OrderProvider with ChangeNotifier {
  //status 0 => cancel, 1 => in processing, 2 => delivering, 3 => delivered
  List<OrderModel> _listOrders = [
    OrderModel(
      idOrder: '123123',
      idUser: 'user1',
      totalPrice: 100,
      quantity: 3,
      statusOrder: 0,
      date: DateTime.now(),
    ),
    OrderModel(
      idOrder: '541231234',
      idUser: 'user1',
      totalPrice: 120,
      quantity: 5,
      statusOrder: 1,
      date: DateTime.now(),
    ),
    OrderModel(
      idOrder: '821371238',
      idUser: 'user1',
      totalPrice: 200,
      quantity: 1,
      statusOrder: 2,
      date: DateTime.now(),
    ),
    OrderModel(
      idOrder: '4444444',
      idUser: 'user1',
      totalPrice: 300,
      quantity: 2,
      statusOrder: 3,
      date: DateTime.now(),
    ),
  ];
  List<OrderModel> get listOrders => _listOrders;

  Future<void> addToOrder({
    double? totalPrice,
    int? quantity,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    _listOrders.add(
      OrderModel(
        idOrder: 'order4',
        idUser: 'user1',
        totalPrice: totalPrice!,
        quantity: quantity!,
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }

  Future<void> fetchAllOrders() async {
    notifyListeners();
  }

  List<OrderModel> inProcessingOrders() {
    return _listOrders.where((order) => order.statusOrder == 0).toList();
  }

  List<OrderModel> deliveringOrders() {
    return _listOrders.where((order) => order.statusOrder == 1).toList();
  }

  List<OrderModel> deliveredOrders() {
    return _listOrders.where((order) => order.statusOrder == 2).toList();
  }

  List<OrderModel> cancelledOrders() {
    return _listOrders.where((order) => order.statusOrder == 3).toList();
  }
}
