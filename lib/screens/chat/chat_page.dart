import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/chat_model.dart';
import 'package:trado_app_uit/widgets/message/chat_input_field.dart';
import 'package:trado_app_uit/widgets/message/message.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(demeChatMessages),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Trado App",
      ),
      leading:
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_rounded)),
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
];
