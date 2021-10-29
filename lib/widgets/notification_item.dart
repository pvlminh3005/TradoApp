import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trado_app_uit/constants/dimen.dart';
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

    return Container(
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
                      CustomText(
                        'Đơn hàng #${notification.idOrder} đã được xác nhận',
                        maxLines: 2,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis viverra arcu vel sagittis consequat facilisis tempus .',
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
              '${DateFormat('dd/MM/yyy').format(notification.date)}',
              fontSize: FontSize.SMALL,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}