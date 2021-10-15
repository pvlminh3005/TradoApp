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

List<NotificationModel> listNotifications = [
  NotificationModel(
    id: 'noti1',
    idCategory: 'c1',
    idOrder: '123456789',
    imageUrl:
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    date: DateTime.now(),
  ),
  NotificationModel(
    id: 'noti2',
    idCategory: 'c2',
    idOrder: '987654321',
    imageUrl:
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    date: DateTime.now(),
    checked: true,
  ),
];
