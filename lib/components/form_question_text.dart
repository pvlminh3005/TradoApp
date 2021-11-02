import 'package:flutter/material.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';

class FormQuestionText extends StatelessWidget {
  final bool login;
  final Function() toggleNavigator;

  FormQuestionText({required this.login, required this.toggleNavigator});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          login ? 'Bạn chưa có tài khoản? ' : 'Bạn đã có tài khoản? ',
          color: kTextDark,
          fontWeight: FontWeight.w700,
        ),
        GestureDetector(
          onTap: toggleNavigator,
          child: CustomText(
            login ? 'Đăng ký ngay' : 'Đăng nhập',
            color: kPrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
