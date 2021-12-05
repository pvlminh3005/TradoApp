import '/controllers/auth_controller.dart';

import 'category_model.dart';

class CartModel {
  late String? id;
  late CategoryModel? category;
  late String? idUser;
  // late int quantity;
  // late int price;

  CartModel({
    this.id,
    this.category,
    this.idUser,
    // this.quantity = 1,
    // this.price = 0,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    category = CategoryModel.fromJson(json);
    idUser = json['idUser'] ?? AuthController.idUser;
    // quantity = json['quantity'] ?? 0;
    // price = json['price'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = id;
    data['idProduct'] = category;
    data['idUser'] = AuthController.idUser;
    // data['quantity'] = quantity;
    // data['price'] = price;
    return data;
  }
}
