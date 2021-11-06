import 'package:flutter/material.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';

class CustomText extends StatelessWidget {
  CustomText(
    this.text, {
    this.fontFamily = font_family,
    this.fontStyle = FontStyle.normal,
    this.color = kTextDark,
    this.fontSize = FontSize.MEDIUM,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.maxLines = 20,
    this.overflow = TextOverflow.ellipsis,
    this.align = TextAlign.start,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
    this.textShadow = null,
    this.decoration,
  });
  final String text;
  final String fontFamily;
  final FontStyle fontStyle;
  final Color color;
  final double fontSize;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign align;
  final FontWeight fontWeight;
  final double letterSpacing;
  final List<Shadow>? textShadow;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          shadows: textShadow,
          decoration: decoration,
        ),
        overflow: overflow,
        maxLines: maxLines!,
        textAlign: align,
      ),
    );
  }
}

// Shadow(
//               offset: Offset(2.5, 4.0),
//               blurRadius: 10.0,
//               color: Color.fromRGBO(0, 0, 0, 0.5),
//             ),
