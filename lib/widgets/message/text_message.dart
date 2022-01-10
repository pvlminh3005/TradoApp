import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/chat_model.dart';

class TextMessage extends StatelessWidget {
  final ChatModel message;

  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0 * 0.75,
        vertical: 16.0 / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0XFF909090).withOpacity(message.isSender! ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message.text!,
        style: TextStyle(
          color: message.isSender! ? Color(0XFFFFFFFF) : Color(0XFF000000),
        ),
      ),
    );
  }
}
