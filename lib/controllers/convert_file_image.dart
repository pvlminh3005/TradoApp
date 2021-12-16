import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import '/utils/firebase_utils.dart';

class ConvertFileImageToString {
  static Future<void> addImageToStorage({
    String? url,
    required File file,
  }) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child(FirebaseUtils.categoryImage)
        .child(url! + '.jpg');
    await ref.putFile(file);
  }

  static Future convertFileToSring({String? url}) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child(FirebaseUtils.categoryImage)
        .child(url! + '.jpg');
    return await ref.getDownloadURL();
  }

  static Future uploadImageUserAndGetUrl({required File file}) async {
    String url = '${AuthController.idUser}_avatar';
    final ref = FirebaseStorage.instance
        .ref()
        .child(FirebaseUtils.userImage)
        .child(url + '.jpg');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}
