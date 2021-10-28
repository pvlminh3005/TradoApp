import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final double? fontSize;
  final double? radius;
  final Color backgroundColor;
  final Color colorIcon;
  final Color textColor;
  final double? margin;

  const CustomInput({
    this.hintText = '',
    this.controller,
    this.icon = null,
    this.fontSize = FontSize.SMALL,
    this.radius = 8,
    this.backgroundColor = kPrimaryColorLight,
    this.colorIcon = kPrimaryColor,
    this.textColor = kTextDark,
    this.margin = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin!),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.horizontalSpacing_16,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: font_family,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
                icon: icon != null
                    ? Icon(icon, color: colorIcon)
                    : SizedBox.shrink(),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
