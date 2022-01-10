import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/chat_model.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';
import 'package:trado_app_uit/widgets/message/chat_input_field.dart';
import 'package:trado_app_uit/widgets/message/message.dart';

class MessageDetailScreen extends StatefulWidget {
  final String? title;

  const MessageDetailScreen({
    this.title = '',
    Key? key,
  }) : super(key: key);

  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showLeading: true,
        title: widget.title!,
      ),
      body: _buildBody(demeChatMessages),
    );
  }

  Widget _buildBody(List<ChatModel>? data) {
    if (data != null) {
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    bool isLastIndex = false;
                    if (index == data.length - 1) {
                      isLastIndex = true;
                    }
                    return Message(
                        message: data[index], isLastIndex: isLastIndex);
                  }),
            ),
          ),
          ChatInputField(),
        ],
      );
    } else
      return Container();
  }
}

List<ChatModel> demeChatMessages = [
  ChatModel(
    text: "Hi Sajol,",
    isSender: false,
  ),
  ChatModel(
    text: "Hello, How are you?",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
  ChatModel(
    text: "My lover",
    isSender: true,
  ),
  ChatModel(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatModel(
    text: "Glad you like it",
    isSender: true,
  ),
];
