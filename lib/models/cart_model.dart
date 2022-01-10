import '/controllers/auth_controller.dart';

import 'category_model.dart';

class CartModel {
  late String? id;
  late CategoryModel? category;
  late String? idUser;
  late int quantity;

  CartModel({
    this.id,
    this.category,
    this.idUser,
    this.quantity = 1,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    category = CategoryModel.fromJson(json['idProduct']);
    idUser = json['idUser'] ?? AuthController.idUser;
    quantity = json['quantity'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idProduct'] = this.category!.id;
    data['idUser'] = AuthController.idUser;
    data['quantity'] = this.quantity;
    return data;
  }
}
