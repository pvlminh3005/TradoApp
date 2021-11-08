class CategoryModel {
  late String id;
  late String idUser;
  late String title;
  late String description;
  late double price;
  late List<String> imageUrl;
  late int amountView;
  late int priceSale;

  CategoryModel({
    required this.id,
    required this.idUser,
    required this.title,
    required this.description,
    this.price = 0,
    required this.imageUrl,
    this.amountView = 0,
    this.priceSale = 0,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    idUser = json['idUser'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    price = json['price'] ?? '';
    imageUrl = json['imageUrl'] ?? [];
    amountView = json['amountView'] ?? 0;
    priceSale = json['priceSale'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['idUser'] = this.idUser;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['amountView'] = this.amountView;
    data['priceSale'] = this.priceSale;
    return data;
  }
}
