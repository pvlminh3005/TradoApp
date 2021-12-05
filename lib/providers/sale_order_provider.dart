import 'package:flutter/material.dart';
import '/models/category_model.dart';
import '/models/shipping_address_model.dart';
import '../models/order_detail_model.dart';
import '/services/order_api.dart';

class SaleOrderProvider with ChangeNotifier {
  // SaleOrderProvider() {
  //   fetchAllSaleOrders();
  // }

  List<OrderDetailModel> _listSaleOrders = [];
  List<OrderDetailModel> get listSaleOrders => _listSaleOrders;

  Future<void> fetchAllSaleOrders() async {
    var data = await OrderApi.fetchAllSaleOrders();
    _listSaleOrders = data;
    notifyListeners();
  }

  Future<void> addToSaleOrder({
    String? idUser,
    ShippingAddressModel? address,
    int? totalPrice,
    TimeOrderModel? time,
    List<CategoryModel> categories = const [],
  }) async {
    await Future.delayed(Duration(seconds: 2));
    var data = OrderDetailModel(
      idUser: idUser!,
      address: address!,
      time: time!,
      categories: categories,
      totalPrice: totalPrice!,
      typeOrder: OrderType.SALEORDER.index,
    );
    _listSaleOrders.add(data);
    print(_listSaleOrders.length);
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

  List<OrderDetailModel> fetchSuccessSaleOrders() {
    return _listSaleOrders
        .where(
          (order) =>
              OrderDetailType.values[order.statusOrder] ==
              OrderDetailType.SUCCESS,
        )
        .toList();
  }

  // Future<OrderDetailModel> fetchDetailOrderById(String id) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   return _listSaleOrders.firstWhere((order) => order.id == id);
  // }

  Future<void> changeStatusOrder(
    String id, {
    required OrderDetailType type,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    int index = _listSaleOrders.indexWhere((order) => order.id == id);

    switch (type) {
      case OrderDetailType.DELIVERING:
        _listSaleOrders[index].statusOrder = OrderDetailType.DELIVERING.index;
        break;
      default:
        _listSaleOrders[index].statusOrder = OrderDetailType.SUCCESS.index;
        break;
    }
    notifyListeners();
  }
}
