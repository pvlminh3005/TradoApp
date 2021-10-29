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
    this.padding = const EdgeInsets.all(AppDimen.spacing_1),
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
          borderRadius: BorderRadius.circular(AppDimen.radiusSmall),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              spreadRadius: 0,
              blurRadius: 10,
              color: kTextDark.withOpacity(.2),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
