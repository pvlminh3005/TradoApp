import 'shipping_address_model.dart';
import 'category_model.dart';

enum OrderType {
  WAITING,
  DELIVERING,
}

class OrderModel {
  final String id;
  final String name;
  late int statusOrder;
  final double totalPrice;
  final int methodPayment;
  final ShippingAddressModel address;
  final List<CategoryModel> categories;
  late TimeOrderModel time;

  OrderModel({
    this.id = '',
    this.name = 'Unknown',
    this.statusOrder = 0, // 1, 2
    this.totalPrice = 0.0,
    this.methodPayment = 1, //1: cash
    required this.address,
    required this.time,
    required this.categories,
  });
}

class TimeOrderModel {
  late DateTime timeOrder;
  late DateTime timeDelivery;
  late DateTime timeFinish;

  TimeOrderModel({
    required this.timeOrder,
    required this.timeDelivery,
    required this.timeFinish,
  });
}
