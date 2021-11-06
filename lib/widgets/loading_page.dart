import 'package:flutter/material.dart';
import '/constants/constants.dart';

class LoadingPage extends StatelessWidget {
  final Color? color;

  const LoadingPage({
    this.color = kPrimaryColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
