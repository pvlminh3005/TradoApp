import 'package:trado_app_uit/models/user_model.dart';

class MessageModel {
  late String? id;
  late UserModel? idUser;
  late String? date;
  late String? lastMessasges;
  late bool? seen;

  MessageModel({
    this.id,
    this.idUser,
    this.date,
    this.lastMessasges,
    this.seen,
  });
}

List<MessageModel> listMessages = [
  MessageModel(
    id: 'msg1',
    idUser: UserModel(
      name: 'Minh',
      imageUrl:
          'https://images.unsplash.com/photo-1638913658828-afb88c3d4d11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    ),
    date: '2/1/2022',
    lastMessasges: 'San pham chinh hang ban nha!',
    seen: false,
  ),
  MessageModel(
    id: 'msg2',
    idUser: UserModel(
      name: 'Long',
      imageUrl:
          'https://images.unsplash.com/photo-1641671032779-002c9f37c038?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0OHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    ),
    date: '20/12/2021',
    lastMessasges: 'San pham tam het hang roi a',
    seen: true,
  ),
  MessageModel(
    id: 'msg3',
    idUser: UserModel(
      name: 'Ha Nhat Linh',
      imageUrl:
          'https://images.unsplash.com/photo-1641721424083-2068d2663a86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    ),
    date: '12/10/2022',
    lastMessasges: 'Cam on ban!',
    seen: true,
  ),
  MessageModel(
    id: 'msg4',
    idUser: UserModel(
      name: 'Duc',
      imageUrl:
          'https://images.unsplash.com/photo-1641681540025-ecdf91b083ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
    ),
    date: '12/10/2021',
    lastMessasges: 'San pham tot',
    seen: false,
  ),
];
