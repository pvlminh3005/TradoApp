class NotificationModel {
  late String? id;
  late String? idCategory;
  late String? idOrder;
  late String? imageUrl;
  late DateTime? date;
  late bool checked;

  NotificationModel({
    this.id,
    this.idCategory,
    this.idOrder,
    this.imageUrl,
    this.date,
    this.checked = false,
  });
}
