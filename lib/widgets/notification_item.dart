import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/providers/notification_provider.dart';
import '/constants/sizes.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    required this.notification,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<NotificationProvider>(builder: (ctx, provider, _) {
      return InkWell(
        onTap: () async {
          await provider.updateNotification(context, notification.id!);
        },
        child: Container(
          color: notification.checked ? kCardColor : Color(0xFFEEEEEE),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(AppDimen.horizontalSpacing_10),
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
                          notification.imageUrl!,
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
                          CustomText(
                            'Đơn hàng #${notification.idOrder} đã được xác nhận',
                            maxLines: 2,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 5),
                          CustomText(
                            'Đơn hàng của bạn đã được xác nhận và giao trong thời gian sớm nhất .',
                            color: kTextColorGrey,
                            fontSize: FontSize.SMALL,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: CustomText(
                  '${DateFormat('dd/MM/yyy').format(notification.date!)}',
                  fontSize: FontSize.SMALL,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
