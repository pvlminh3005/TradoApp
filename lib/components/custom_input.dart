import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final Color iconColor;
  final Color backgroundColor;
  final IconData? prefixIcon;
  final double? fontSize;
  final double? radius;
  final double? height;
  final Color colorIcon;
  final Color textColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderWidth;
  final int maxLength;
  final Color borderColor;
  final String labelText;
  final TextInputType keyboardType;
  final FontWeight fontWeight;
  final int maxLines;

  const CustomInput({
    this.controller,
    this.hintText = '',
    this.labelText = '',
    this.showPrefixIcon = false,
    this.showSuffixIcon = false,
    this.prefixIcon = null,
    this.iconColor = kPrimaryColor,
    this.fontSize = FontSize.SMALL,
    this.radius = AppDimen.radiusNormal,
    this.height = 1,
    this.backgroundColor = kBackgroundColorWhite,
    this.colorIcon = kPrimaryColor,
    this.textColor = kTextColorGrey,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.symmetric(
      vertical: AppDimen.spacing_3 - 3,
      horizontal: AppDimen.horizontalSpacing_10,
    ),
    this.borderWidth = 1,
    this.maxLength = 100,
    this.borderColor = Colors.transparent,
    this.keyboardType = TextInputType.text,
    this.fontWeight = FontWeight.w500,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.showSuffixIcon ? obscureText : false,
              maxLines: widget.showSuffixIcon ? 1 : widget.maxLines,
              maxLength: widget.maxLength,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: widget.keyboardType,
              style: TextStyle(
                fontSize: FontSize.MEDIUM,
                fontWeight: widget.fontWeight,
                height: widget.height,
              ),
              decoration: InputDecoration(
                counterText: '',
                contentPadding: widget.padding,
                filled: true,
                fillColor: widget.backgroundColor,
                hintText: widget.labelText.isNotEmpty ? null : widget.hintText,
                labelText: widget.hintText.isNotEmpty ? null : widget.labelText,
                hintStyle: TextStyle(
                  fontFamily: font_family,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                  color: kTextColorGrey,
                ),
                labelStyle: TextStyle(
                  fontFamily: font_family,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                  color: kTextColorGrey,
                ),
                prefixIcon: widget.showPrefixIcon
                    ? Icon(widget.prefixIcon, color: widget.iconColor)
                    : null,
                suffixIcon: widget.showSuffixIcon ? _buildObscure() : null,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: widget.borderWidth,
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(widget.radius!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: widget.borderWidth,
                    color: widget.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(widget.radius!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObscure() {
    return GestureDetector(
      onTap: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      child: Icon(
        !obscureText ? Icons.visibility : Icons.visibility_off,
        color: widget.colorIcon,
      ),
    );
  }
}
