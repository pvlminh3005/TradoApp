import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/providers/order_provider.dart';
import 'package:trado_app_uit/screens/order/order_detail_screen.dart';
import '/models/notification_model.dart';
import '/services/notification_api.dart';

class NotificationProvider with ChangeNotifier {
  NotificationProvider() {
    fetchNotifications();
  }

  List<NotificationModel> _listNotifications = [];
  List<NotificationModel> get listNotifications => _listNotifications;

  Future<void> fetchNotifications() async {
    _listNotifications = await NotificationApi.fetchNotifications();
    notifyListeners();
  }

  Future<dynamic> refreshNotifications() async {
    notifyListeners();
    return _listNotifications = [
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
  }

  Future updateNotification(BuildContext context, String id) async {
    Future.wait(_listNotifications.map((notification) async {
      print(notification.id);
      if (notification.id == id) {
        await Provider.of<OrderProvider>(context, listen: false)
            .fetchOrderById(notification.idOrder);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OrderDetailScreen(idOrder: notification.idOrder)),
        );
        return notification.checked = true;
      }
    }));

    notifyListeners();
  }
}
