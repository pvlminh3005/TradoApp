import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '/components/custom_text.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void dialogMessenger(BuildContext context, String content) {
    var snackBar = SnackBar(
      content: CustomText(
        content,
        color: kTextLight,
        fontSize: FontSize.SMALL,
      ),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
