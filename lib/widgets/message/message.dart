import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/chat_model.dart';
import 'package:trado_app_uit/widgets/message/text_message.dart';

class Message extends StatelessWidget {
  final ChatModel message;
  final bool isLastIndex;

  Message({
    Key? key,
    required this.isLastIndex,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            message.isSender! ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isSender!) ...[
            CircleAvatar(
              radius: 16,
              //backgroundImage: Assets.images.user2,
            ),
            SizedBox(width: 8.0 / 2),
          ],
          TextMessage(message: message),
        ],
      ),
    );
  }
}
