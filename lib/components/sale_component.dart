import 'package:flutter/material.dart';
import '/constants/sizes.dart';

import '/constants/constants.dart';
import 'custom_text.dart';

class SaleComponent extends StatelessWidget {
  final int text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const SaleComponent({
    required this.text,
    this.fontSize = FontSize.MEDIUM,
    this.fontWeight = FontWeight.w500,
    this.color = kTextDark,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: .7,
          color: kErrorColor,
        ),
        color: kErrorLightColor,
      ),
      child: CustomText(
        '- ${text.toStringAsFixed(0)}%',
        color: kErrorColor,
        fontSize: FontSize.SMALL,
      ),
    );
  }
}
