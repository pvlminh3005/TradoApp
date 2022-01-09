class ChatModel {
  final String? text;
  final bool? isSender;

  ChatModel({
    this.text = '',
    required this.isSender,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      text: map['text'] as String,
      isSender: map['isSender'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "text": this.text,
      "isSender": this.isSender,
    };
  }
}
