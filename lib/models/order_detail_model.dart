import 'shipping_address_model.dart';
import 'category_model.dart';

enum OrderDetailType {
  WAITING,
  DELIVERING,
  SUCCESS,
}

enum StatusOrderType {
  PROCESSING, //0
  DELIVERING, //1
  SUCCESS, //2
  CANCEL, //3
}

class OrderDetailModel {
  final String id;
  final String idUser;
  final String name;
  late int statusOrder;
  final int totalPrice;
  final int methodPayment;
  final int quantityCategories;
  final ShippingAddressModel address;
  final List<CategoryModel> categories;
  late TimeOrderModel time;

  OrderDetailModel({
    this.id = '',
    required this.idUser,
    this.name = 'Unknown',
    this.statusOrder = 0, // 1, 2
    this.totalPrice = 0,
    this.methodPayment = 1, //1: cash
    this.quantityCategories = 0,
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

class OrderModel {
  final String? idOrder;
  final String? idUser;
  final DateTime? date;
  final int quantity;
  final int totalPrice;
  final int statusOrder;

  OrderModel({
    this.idOrder,
    required this.idUser,
    this.date,
    this.quantity = 0,
    this.totalPrice = 0,
    this.statusOrder = 0,
  });
}
