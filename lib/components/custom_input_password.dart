import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';

class CustomInputPassword extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final double? fontSize;
  final double? radius;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets margin;

  const CustomInputPassword({
    this.hintText = '',
    this.controller,
    this.icon = Icons.lock,
    this.fontSize = FontSize.SMALL,
    this.radius = AppDimen.radiusBig_2,
    this.backgroundColor = kPrimaryColorLight,
    this.textColor = kTextColorGrey,
    this.margin = const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
    Key? key,
  }) : super(key: key);

  @override
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.horizontalSpacing_16,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius!),
        color: widget.backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontFamily: font_family,
                  fontSize: widget.fontSize,
                  color: widget.textColor,
                ),
                icon: widget.icon != null
                    ? Icon(widget.icon, color: kPrimaryColor)
                    : SizedBox.shrink(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
