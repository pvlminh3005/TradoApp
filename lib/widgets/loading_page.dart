import 'package:flutter/material.dart';
import '/constants/constants.dart';

class LoadingPage extends StatelessWidget {
  final Color? color;
  final double width;
  final double size;

  const LoadingPage({
    this.color = kPrimaryColor,
    this.width = 2,
    this.size = 25.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: width,
        ),
      ),
    );
  }
}
