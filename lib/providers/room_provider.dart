import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/message_model.dart';
import 'package:trado_app_uit/services/room_api.dart';

class RoomProvider with ChangeNotifier {
  RoomProvider() {
    fetchAllRoom();
  }
  List<MessageModel> _listRoom = [];
  List<MessageModel> get listRoom => _listRoom;

  Future<void> fetchAllRoom() async {
    _listRoom = await RoomApi.fetchRoom();
    notifyListeners();
  }
}
