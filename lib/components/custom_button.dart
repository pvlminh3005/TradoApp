import 'package:flutter/material.dart';
import '/constants/dimen.dart';
import '/widgets/loading_page.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';
import 'custom_text.dart';

class CustomBottomSizeStyle {
  static const WRAP_CONTENT = 0;
  static const MATCH_PARENT = 1;
}

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? indicatorColor;
  final double? radius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlignment;
  final int sizeStyle;
  final double borderOpacity;
  final double borderWidth;

  final Function()? onTap;
  final bool? isLoading;

  const CustomButton(
    this.title, {
    this.backgroundColor = kPrimaryColor,
    this.textColor = kTextLight,
    this.indicatorColor = kBackgroundColorWhite,
    this.radius = AppDimen.radiusBig_2,
    this.padding =
        const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_16),
    this.margin = const EdgeInsets.all(0),
    this.fontSize = FontSize.BIG,
    this.fontWeight = FontWeight.w700,
    this.textAlignment = TextAlign.center,
    this.sizeStyle = CustomBottomSizeStyle.MATCH_PARENT,
    this.borderOpacity = 0.3,
    this.borderWidth = 0,
    this.onTap,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sizeStyle == CustomBottomSizeStyle.WRAP_CONTENT
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [_buildChild()],
          )
        : _buildChild();
  }

  Widget _buildChild() {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius!),
          border: Border.all(
            color: Colors.grey.withOpacity(borderOpacity),
            width: borderWidth,
          ),
        ),
        child: isLoading!
            ? SizedBox(
                width: 22,
                height: 22,
                child: LoadingPage(color: indicatorColor),
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
    );
  }
}
