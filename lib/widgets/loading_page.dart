import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
        strokeWidth: 2,
      ),
    );
  }
}
