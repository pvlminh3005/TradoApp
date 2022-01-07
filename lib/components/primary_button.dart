import 'package:flutter/material.dart';
import '/components/custom_button.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool? primaryStyle;
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final Color? textColor;
  final EdgeInsets margin;
  final double borderWidth;
  final double borderOpacity;
  final bool showShadow;

  const PrimaryButton({
    Key? key,
    this.title = "OK",
    this.onPressed,
    this.primaryStyle = true,
    this.primaryColor = kPrimaryColor,
    this.backgroundColor = kPrimaryColor,
    this.indicatorColor = kPrimaryColor,
    this.textColor = Colors.white,
    this.margin = const EdgeInsets.all(0),
    this.borderWidth = 0,
    this.borderOpacity = 0,
    this.showShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: margin,
        height: 52.0,
        decoration: onPressed != null
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                    blurRadius: 15,
                    color: showShadow
                        ? Color(0xFF8A959E).withOpacity(.35)
                        : Colors.transparent,
                  ),
                ],
              )
            : null,
        child: CustomButton(
          title,
          padding: EdgeInsets.all(16),
          fontSize: FontSize.BIG,
          textColor: textColor,
          backgroundColor: onPressed != null ? backgroundColor : kColorItemGrey,
          indicatorColor:
              backgroundColor == kPrimaryColor ? Colors.white : indicatorColor!,
          radius: AppDimen.radiusNormal,
          borderWidth: borderWidth,
          borderOpacity: borderOpacity,
          sizeStyle: CustomBottomSizeStyle.MATCH_PARENT,
          onTap: onPressed != null
              ? () async {
                  await onPressed!();
                }
              : () {},
        ),
      ),
    );
  }
}
