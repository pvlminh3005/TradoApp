import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageController {
  ImageController._();

  static Future openImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      return imageTemporary;
    } on PlatformException catch (e) {
      print('Có lỗi xảy ra khi chọn ảnh: $e');
    }
  }

  static Future openCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
