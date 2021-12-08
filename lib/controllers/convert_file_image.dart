import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import '/utils/firebase_utils.dart';

class ConvertFileImageToString {
  static Future<void> addImageToStorage(
      {String? url, required File file}) async {
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
}
