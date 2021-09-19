import 'package:flutter/material.dart';

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
          style: Theme.of(context).textTheme.bodyText1,
        ),
        GestureDetector(
          onTap: toggleNavigator,
          child: Text(
            login ? 'Đăng ký ngay' : 'Đăng nhập',
            style: Theme.of(context).textTheme.bodyText1?.merge(
                  TextStyle(color: Theme.of(context).primaryColor),
                ),
          ),
        )
      ],
    );
  }
}
