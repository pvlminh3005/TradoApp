import 'dart:async';

import 'package:flutter/material.dart';
import '/utils/conver_scaffold_messenger.dart';
import '/routes/routes_manage.dart';
import '/utils/auth_preferences.dart';
import '/controllers/auth_controller.dart';

class SignInProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signInApp(
      BuildContext context, String username, String password) async {
    _isLoading = true;
    print('gg');
    await ApiController().signIn(username, password).then((tokenUser) async {
      if (tokenUser == null) {
        dialogMessenger(context, 'Tài khoản hoặc mật khẩu không đúng');
        _isLoading = false;
        notifyListeners();
        return;
      }
      await AuthPreferences.setToken(tokenUser['accessToken']);
      await Timer(
        Duration(seconds: 2),
        () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteManage.navigator_tab,
            (Route<dynamic> route) => false,
          );
          _isLoading = false;
        },
      );
      notifyListeners();
    });
  }
}
