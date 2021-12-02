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
  late int quantityCategories;
  late ShippingAddressModel address;
  late List<CategoryModel> categories;
  late TimeOrderModel time;
  late int typeOrder;

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
    required this.typeOrder,
  });

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    idUser = json['idUser'] ?? '';
    name = json['name'] ?? 'Unknown';
    statusOrder = json['statusOrder'] ?? 0;
    totalPrice = json['totalPrice'] ?? 0;
    methodPayment = json['methodPaymen'] ?? 1;
    quantityCategories = json['quantityCategories'] ?? 0;
    address = json['address'];
    time = TimeOrderModel.fromJson(json['data']);
    categories = json['categories'] ?? [];
    this.typeOrder = json['typeOrder'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['idUser'] = this.idUser;
    data['name'] = this.name;
    data['statusOrder'] = this.statusOrder;
    data['totalPrice'] = this.totalPrice;
    data['methodPayment'] = this.methodPayment;
    data['quantityCategories'] = this.quantityCategories;
    data['address'] = this.address;
    data['time'] = this.time;
    data['categories'] = this.categories;
    data['typeOrder'] = this.typeOrder;
    return data;
  }
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

  TimeOrderModel.fromJson(Map<String, dynamic> json) {
    timeOrder = json['timeOrder'];
    timeDelivery = json['timeDelivery'];
    timeFinish = json['timeFinish'];
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
