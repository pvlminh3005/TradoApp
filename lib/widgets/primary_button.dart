import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_button.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool? primaryStyle;
  final Color? primaryColor;
  final Color? backgroundColor;
  final EdgeInsets margin;

  const PrimaryButton({
    Key? key,
    this.title = "OK",
    this.onPressed,
    this.primaryStyle = true,
    this.primaryColor = kPrimaryColor,
    this.backgroundColor = kPrimaryColor,
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: margin,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kBlack.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: CustomButton(
          title,
          padding: EdgeInsets.all(16),
          fontSize: FontSize.BIG,
          backgroundColor: backgroundColor,
          radius: AppDimen.radiusNormal,
          sizeStyle: CustomBottomSizeStyle.MATCH_PARENT,
        ),
      ),
    );
  }
}
