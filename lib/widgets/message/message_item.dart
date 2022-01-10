import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/card_shadow.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/models/message_model.dart';
import 'package:trado_app_uit/screens/message/message_detail_screen.dart';
import 'package:trado_app_uit/widgets/custom_avatar.dart';

class MessageItem extends StatelessWidget {
  final MessageModel? message;

  const MessageItem({
    this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MessageDetailScreen(title: message!.idUser!.name!),
        ));
      },
      child: CardShadow(
        margin: const EdgeInsets.symmetric(vertical: 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomAvatar(
                  radius: 16.0,
                  imageUrl: message!.idUser!.imageUrl!,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      message!.idUser!.name!,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      message!.date!,
                      fontSize: FontSize.SMALL,
                      color: kTextColorGrey,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            CustomText(
              message!.lastMessasges!,
              color: kTextColorGrey,
            ),
          ],
        ),
      ),
    );
  }
}
