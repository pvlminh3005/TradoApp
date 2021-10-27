import 'package:flutter/material.dart';
import '/constants/sizes.dart';
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
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: kTextBoldLight_12,
            ),
          ),
        )
      ],
    );
  }
}
