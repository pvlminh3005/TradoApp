import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final double size;
  final Color color;
  final EdgeInsets margin;
  final Function()? onTap;

  const CustomIcon(
    this.icon, {
    this.size = AppDimen.icon_size,
    this.color = kTextColorGrey,
    this.margin = const EdgeInsets.all(0.0),
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: Icon(
          icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
