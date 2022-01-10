import 'cart_model.dart';
import 'shipping_address_model.dart';

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

enum OrderType {
  PURCHASEORDER, // 0
  SALEORDER, // 1
}

class OrderDetailModel {
  late String id;
  late String idUser;
  late String name;
  late int statusOrder;
  late int totalPrice;
  late int methodPayment;
  late ShippingAddressModel address;
  late List<CartModel> categories;
  late TimeOrderModel time;
  late int? typeOrder;

  OrderDetailModel({
    this.id = '',
    required this.idUser,
    this.name = 'Unknown',
    this.statusOrder = 0, // 1, 2
    this.totalPrice = 0,
    this.methodPayment = 1, //1: cash
    required this.address,
    required this.time,
    required this.categories,
    this.typeOrder,
  });

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    idUser = json['idUser'] ?? '';
    name = json['name'] ?? 'Unknown';
    statusOrder = json['statusOrder'] ?? 0;
    totalPrice = json['totalPrice'] ?? 0;
    methodPayment = json['methodPayment'] ?? 1;
    address = json['address'];
    time = TimeOrderModel.fromJson(json['time']);
    categories = json['categories'].map((json) => CartModel.fromJson(json));
    this.typeOrder = json['typeOrder'] ?? OrderType.PURCHASEORDER.index;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idUser'] = this.idUser;
    data['name'] = this.name;
    data['statusOrder'] = this.statusOrder;
    data['totalPrice'] = this.totalPrice;
    data['methodPayment'] = this.methodPayment;
    data['address'] = address.id;
    data['categories'] = this.categories.map((data) => data.id);
    return data;
  }
}

class TimeOrderModel {
  late DateTime? timeOrder;
  late DateTime? timePayment;
  late DateTime? timeDelivery;
  late DateTime? timeFinish;
  late DateTime? timeCancel;

  TimeOrderModel({
    this.timeOrder,
    this.timeDelivery,
    this.timeFinish,
  });

  TimeOrderModel.fromJson(Map<String, dynamic> json) {
    timeOrder = json['timeOrder'];
    timePayment = json['timePayment'];
    timeDelivery = json['timeDelivery'];
    timeFinish = json['timeFinish'];
    timeCancel = json['timeCancel'];
  }
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
