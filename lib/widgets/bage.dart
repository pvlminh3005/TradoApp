import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;

  Badge({
    required this.child,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: CircleAvatar(
            radius: 9,
            backgroundColor: kErrorColor,
            child: CustomText(
              value,
              align: TextAlign.center,
              color: kTextLight,
              fontSize: FontSize.SMALL_1,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
