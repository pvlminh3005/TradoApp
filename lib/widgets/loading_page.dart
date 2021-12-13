import 'package:flutter/material.dart';
import '/constants/constants.dart';

class LoadingPage extends StatelessWidget {
  final Color? color;
  final double width;

  const LoadingPage({
    this.color = kPrimaryColor,
    this.width = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: width,
      ),
    );
  }
}
