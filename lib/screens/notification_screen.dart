import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/widgets/notification_item.dart';
import '/models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listNotifications.length,
        itemBuilder: (BuildContext context, int index) {
          NotificationModel notification = listNotifications[index];
          return NotificationItem(notification: notification);
        },
      ),
    );
  }
}
