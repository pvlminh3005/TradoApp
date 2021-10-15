import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trado_app_uit/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    required this.notification,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      color: notification.checked ? theme.cardColor : Color(0xFFEEEEEE),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      notification.imageUrl,
                      width: size.width * .2,
                      height: size.width * .2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Đơn hàng #${notification.idOrder} đã được xác nhận',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyText1,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis viverra arcu vel sagittis consequat facilisis tempus .',
                        style: theme.textTheme.headline2?.merge(
                          TextStyle(
                            color: theme.textSelectionColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '${DateFormat('dd/MM/yyy').format(notification.date)}',
              style: theme.textTheme.headline2?.merge(
                TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
