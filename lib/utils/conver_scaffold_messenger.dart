import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '/components/custom_text.dart';

void dialogMessenger(BuildContext context, String content) {
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
