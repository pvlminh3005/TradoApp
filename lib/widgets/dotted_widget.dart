import 'package:flutter/material.dart';
import '/constants/constants.dart';

class DottedWidget extends StatelessWidget {
  final Widget? child;
  final Color? dottedColor;

  const DottedWidget({
    this.child,
    this.dottedColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        child!,
        _buildDotted(),
      ],
    );
  }

  Widget _buildDotted() {
    return CircleAvatar(
      radius: 3,
      backgroundColor: dottedColor ?? kErrorColor,
    );
  }
}
