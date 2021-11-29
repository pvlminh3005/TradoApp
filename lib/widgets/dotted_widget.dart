import 'package:flutter/material.dart';
import '/constants/constants.dart';

class DottedWidget extends StatelessWidget {
  final Widget? child;
  final Color? dottedColor;
  final bool showDotted;

  const DottedWidget({
    this.child,
    this.dottedColor,
    this.showDotted = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        child!,
        showDotted ? _buildDotted() : const SizedBox.shrink(),
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
