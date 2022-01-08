class NotificationModel {
  late String id;
  late String idCategory;
  late String idOrder;
  late String imageUrl;
  late DateTime date;
  late bool checked;

  NotificationModel({
    required this.id,
    required this.idCategory,
    required this.idOrder,
    required this.imageUrl,
    required this.date,
    this.checked = false,
  });
}
