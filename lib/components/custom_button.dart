import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;
  final double? padding;
  final double? margin;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlignment;

  final Function()? onTap;
  final bool? isLoading;

  const CustomButton({
    this.title,
    this.backgroundColor = kPrimaryColor,
    this.textColor,
    this.radius = 8,
    this.padding = AppDimen.verticalSpacing_10,
    this.margin = AppDimen.verticalSpacing_5,
    this.fontSize = FontSize.MEDIUM,
    this.fontWeight = FontWeight.w700,
    this.textAlignment = TextAlign.center,
    this.onTap,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(margin!),
        padding: EdgeInsets.symmetric(vertical: padding!),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: backgroundColor,
        ),
        child: Center(
          child: isLoading!
              ? SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    color: kBackgroundColorWhite,
                    strokeWidth: 2,
                  ),
                )
              : CustomText(
                  title!,
                  overflow: TextOverflow.visible,
                  color: textColor!,
                  fontSize: fontSize!,
                  fontWeight: fontWeight,
                  align: textAlignment!,
                ),
        ),
      ),
    );
  }
}
