import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/order_detail_model.dart';
import 'package:trado_app_uit/services/order_api.dart';

class OrderProvider with ChangeNotifier {
  OrderProvider() {
    fetchAllMyOrders();
  }
  //status 0 => cancel, 1 => in processing, 2 => delivering, 3 => delivered

  List<OrderModel> _listOrders = [];
  List<OrderModel> get listOrders => _listOrders;

  Future<void> fetchAllMyOrders() async {
    _listOrders = await OrderApi.fetchAllMyOrders();
    notifyListeners();
  }

  Future<void> addToOrder({
    int? totalPrice,
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
