class CategoryModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> imageUrl;
  final int amountView;
  final int amoutComment;
  final double amountVoteStars;
  final int priceSale;

  CategoryModel({
    required this.id,
    required this.title,
    required this.description,
    this.price = 0,
    required this.imageUrl,
    this.amountView = 0,
    this.amoutComment = 0,
    this.amountVoteStars = 0,
    this.priceSale = 0,
  });
}
