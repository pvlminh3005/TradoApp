import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_refresh_page.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/models/message_model.dart';
import 'package:trado_app_uit/providers/room_provider.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';
import 'package:trado_app_uit/widgets/message/message_item.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late RoomProvider provider;
  late List<MessageModel> listMessages = [];

  Future<void> fetchRoomData() async {
    await Provider.of<RoomProvider>(context, listen: false).fetchAllRoom();
  }

  @override
  void initState() {
    super.initState();
    listMessages = Provider.of<RoomProvider>(context, listen: false).listRoom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          showLeading: false,
          showCart: true,
          title: 'Tin nhắn',
        ),
        body: Consumer<RoomProvider>(builder: (ctx, provider, _) {
          return CustomRefreshPage(
            onRefresh: () async {
              await Provider.of<RoomProvider>(context, listen: false)
                  .fetchAllRoom();
            },
            child: Container(
              padding: const EdgeInsets.all(AppDimen.spacing_1),
              child: ListView.builder(
                itemCount: provider.listRoom.length,
                itemBuilder: (BuildContext context, int index) {
                  return MessageItem(message: provider.listRoom[index]);
                },
              ),
            ),
          );
        }));
  }
}
