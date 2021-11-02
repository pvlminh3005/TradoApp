import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/providers/notification_provider.dart';
import 'package:trado_app_uit/widgets/custom_refresh_page.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';

import '/constants/constants.dart';
import '/widgets/notification_item.dart';
import '/models/notification_model.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerNotification = Provider.of<NotificationProvider>(context);
    List listNotifications = providerNotification.listNotifications;
    return CustomRefreshPage(
      onRefresh: providerNotification.refreshNotifications,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: listNotifications.isEmpty
            ? LoadingPage()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: providerNotification.listNotifications.length,
                itemBuilder: (BuildContext context, int index) {
                  NotificationModel notification =
                      providerNotification.listNotifications[index];
                  return NotificationItem(notification: notification);
                },
              ),
      ),
    );
  }
}
