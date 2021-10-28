import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/sizes.dart';

class CustomInputPassword extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final double? fontSize;
  final double? radius;
  final Color backgroundColor;
  final double? margin;

  const CustomInputPassword({
    this.hintText = '',
    this.controller,
    this.icon = null,
    this.fontSize = FontSize.MEDIUM,
    this.radius = 8,
    this.backgroundColor = kPrimaryColorLight,
    this.margin = 0,
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
      margin: EdgeInsets.all(widget.margin!),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontFamily: font_family,
                  fontSize: widget.fontSize,
                ),
                icon: widget.icon != null
                    ? Icon(widget.icon, color: kPrimaryColor)
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
