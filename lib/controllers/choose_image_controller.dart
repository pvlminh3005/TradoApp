import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '/widgets/custom_image_bottom_sheet_widget.dart';

class ImageController {
  ImageController._();

  static File? file;

  static Future openImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // return imageTemporary;
      file = imageTemporary;
    } on PlatformException catch (e) {
      print('Có lỗi xảy ra khi chọn ảnh: $e');
    }
  }

  static Future openCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  static Future<void> showBottomSheetManageImage(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (builder) => CustomImageBttomSheetWidget(),
    );
  }
}
