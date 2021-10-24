import 'package:flutter/material.dart';
import '/constants/sizes.dart';

class FormQuestionText extends StatelessWidget {
  final bool login;
  final Function() toggleNavigator;

  FormQuestionText({required this.login, required this.toggleNavigator});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Bạn chưa có tài khoản? ' : 'Bạn đã có tài khoản? ',
          style: kTextBoldDark_16,
        ),
        GestureDetector(
          onTap: toggleNavigator,
          child: Text(
            login ? 'Đăng ký ngay' : 'Đăng nhập',
            style: kTextBoldPrimary_16,
          ),
        )
      ],
    );
  }
}

//FIX colors
