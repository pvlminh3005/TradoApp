enum CategoryType {
  ANOTHER_CATEGORY,
  MY_CATEGORY,
}

class CategoryModel {
  late String id;
  late String idUser;
  late String title;
  late String description;
  late double price;
  late List<dynamic> imageUrl;
  late int amountView;
  late int priceSale;
  late int quantity;
  late bool status;

  CategoryModel({
    required this.id,
    required this.idUser,
    required this.title,
    this.description = '',
    required this.imageUrl,
    this.price = 0.0,
    this.amountView = 0,
    this.priceSale = 0,
    this.quantity = 0,
    this.status = true,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    idUser = json['idUserSell'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    price = json['price'] ?? 0.0;
    imageUrl = json['imageUrl'] ?? [];
    amountView = json['amountView'] ?? 0;
    priceSale = json['priceSale'] ?? 0;
    quantity = json['quantity'] ?? 0;
    status = json['status'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['idUserSell'] = this.idUser;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['amountView'] = this.amountView;
    data['priceSale'] = this.priceSale;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    return data;
  }
}
