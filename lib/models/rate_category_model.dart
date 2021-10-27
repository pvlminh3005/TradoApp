class RateModel {
  final String id;
  final String idCategory;
  final String nameUser;
  final String imageUrl;
  final DateTime date;
  final String comment;
  final double stars;

  RateModel({
    required this.id,
    required this.idCategory,
    required this.nameUser,
    required this.imageUrl,
    required this.date,
    required this.comment,
    required this.stars,
  });
}
