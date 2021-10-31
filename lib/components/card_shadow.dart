import 'package:flutter/material.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';

class CardShadow extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? height;
  final Function()? onTap;

  const CardShadow({
    this.child = const SizedBox.shrink(),
    this.padding = const EdgeInsets.all(AppDimen.spacing_2),
    this.margin = const EdgeInsets.all(0),
    this.height = null,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 30,
              color: Color(0xFF8A959E).withOpacity(.2),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
