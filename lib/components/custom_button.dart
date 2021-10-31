import 'package:flutter/material.dart';
import 'package:trado_app_uit/utils/convert_timer.dart';
import '/constants/dimen.dart';
import '/widgets/loading_page.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';
import 'custom_text.dart';

class CustomBottomSizeStyle {
  static const WRAP_CONTENT = 0;
  static const MATCH_PARENT = 1;
}

class CustomButton extends StatefulWidget {
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
    Key? key,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  void changeLoad() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.sizeStyle == CustomBottomSizeStyle.WRAP_CONTENT
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [_buildChild()],
          )
        : _buildChild();
  }

  Widget _buildChild() {
    return InkWell(
      onTap: () async {
        changeLoad();
        await widget.onTap!();
        changeLoad();
      },
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius!),
          border: Border.all(
            color: Colors.grey.withOpacity(widget.borderOpacity),
            width: widget.borderWidth,
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: LoadingPage(color: widget.indicatorColor),
              )
            : CustomText(
                widget.title!,
                overflow: TextOverflow.visible,
                color: widget.textColor!,
                fontSize: widget.fontSize!,
                fontWeight: widget.fontWeight,
                align: widget.textAlignment!,
              ),
      ),
    );
  }
}
