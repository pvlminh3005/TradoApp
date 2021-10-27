import 'package:flutter/material.dart';
import '/constants/sizes.dart';

void dialogMessenger(BuildContext context, String content) {
  var snackBar = SnackBar(
    content: Text(
      content,
      style: kTextMediumLight_14,
    ),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
