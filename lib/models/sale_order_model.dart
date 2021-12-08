import 'package:trado_app_uit/models/shipping_address_model.dart';

class SaleOrderModel {
  late String? id;
  late String? nameUser;
  late List<String> listCategories;
  late double totalPrice;
  late ShippingAddressModel? detailOrder;

  SaleOrderModel({
    this.id = '',
    this.nameUser = '',
    required this.listCategories,
    this.totalPrice = 0.0,
    required this.detailOrder,
  });
}
