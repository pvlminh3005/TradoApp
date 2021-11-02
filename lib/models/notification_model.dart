class NotificationModel {
  final String id;
  final String idCategory;
  final String idOrder;
  final String imageUrl;
  late DateTime date;
  final bool checked;

  NotificationModel({
    required this.id,
    required this.idCategory,
    required this.idOrder,
    required this.imageUrl,
    required this.date,
    this.checked = false,
  });
}
