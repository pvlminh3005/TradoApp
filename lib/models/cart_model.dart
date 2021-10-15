class CartModel {
  final String id;
  final String title;
  final String imageUrl;
  late int quantity;
  final double price;

  CartModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
}
