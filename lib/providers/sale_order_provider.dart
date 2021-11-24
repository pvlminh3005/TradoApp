import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/order_model.dart';
import 'package:trado_app_uit/services/order_api.dart';

class SaleOrderProvider with ChangeNotifier {
  SaleOrderProvider() {
    fetchAllSaleOrders();
  }

  List<OrderModel> _listSaleOrders = [];
  List<OrderModel> get listSaleOrders => _listSaleOrders;

  Future<void> fetchAllSaleOrders() async {
    var data = await OrderApi.fetchAllSaleOrders();
    _listSaleOrders = data;
    notifyListeners();
  }

  List<OrderModel> fetchWaitingSaleOrders() {
    return _listSaleOrders
        .where(
          (order) => OrderType.values[order.statusOrder] == OrderType.WAITING,
        )
        .toList();
  }

  List<OrderModel> fetchDeliveringSaleOrders() {
    return _listSaleOrders
        .where(
          (order) =>
              OrderType.values[order.statusOrder] == OrderType.DELIVERING,
        )
        .toList();
  }

  Future<void> changeStatusOrder(String id) async {
    int index = _listSaleOrders.indexWhere((order) => order.id == id);
    _listSaleOrders[index].statusOrder = 1;
    notifyListeners();
  }
}
