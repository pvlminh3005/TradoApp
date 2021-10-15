import 'package:flutter/material.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';

import '/widgets/notification_item.dart';
import '/models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
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
