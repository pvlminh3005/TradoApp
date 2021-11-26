import 'package:flutter/material.dart';
import '../models/order_detail_model.dart';
import '/services/order_api.dart';

class SaleOrderProvider with ChangeNotifier {
  SaleOrderProvider() {
    fetchAllSaleOrders();
  }

  List<OrderDetailModel> _listSaleOrders = [];
  List<OrderDetailModel> get listSaleOrders => _listSaleOrders;

  Future<void> fetchAllSaleOrders() async {
    var data = await OrderApi.fetchAllSaleOrders();
    _listSaleOrders = data;
    notifyListeners();
  }

  List<OrderDetailModel> fetchWaitingSaleOrders() {
    return _listSaleOrders
        .where(
          (order) =>
              OrderDetailType.values[order.statusOrder] ==
              OrderDetailType.WAITING,
        )
        .toList();
  }

  List<OrderDetailModel> fetchDeliveringSaleOrders() {
    return _listSaleOrders
        .where(
          (order) =>
              OrderDetailType.values[order.statusOrder] ==
              OrderDetailType.DELIVERING,
        )
        .toList();
  }

  // Future<OrderDetailModel> fetchDetailOrderById(String id) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   return _listSaleOrders.firstWhere((order) => order.id == id);
  // }

  Future<void> changeStatusOrder(String id) async {
    int index = _listSaleOrders.indexWhere((order) => order.id == id);
    _listSaleOrders[index].statusOrder = 1;
    notifyListeners();
  }
}
