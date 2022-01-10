import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_refresh_page.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/models/message_model.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';
import 'package:trado_app_uit/widgets/message/message_item.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showLeading: false,
        showCart: true,
        title: 'Tin nhắn',
      ),
      body: CustomRefreshPage(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
        },
        child: Container(
          padding: const EdgeInsets.all(AppDimen.spacing_1),
          child: ListView.builder(
            itemCount: listMessages.length,
            itemBuilder: (BuildContext context, int index) {
              return MessageItem(message: listMessages[index]);
            },
          ),
        ),
      ),
    );
  }
}
