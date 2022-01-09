import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0 / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0XFF303030).withOpacity(0.2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0 * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Color(0XFF303030).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type message",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: Icon(Icons.send, color: Color(0XFF303030)),
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}
