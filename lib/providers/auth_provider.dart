import 'dart:async';

import 'package:flutter/material.dart';
import '/controllers/auth_controller.dart';
import '/models/user_model.dart';
import '/routes/routes_manage.dart';
import '/screens/edit_info_profile_screen.dart';
import '/utils/auth_preferences.dart';
import '/utils/conver_scaffold_messenger.dart';

class AuthProvider extends ChangeNotifier {
  // static var user;
  static late UserModel _currentUser;
  static UserModel get currentUser => _currentUser;

  Future getCurrentUser() async {
    _currentUser = await AuthController().getCurrentUser();
    notifyListeners();
  }

  Future<void> signInApp(
      BuildContext context, String username, String password) async {
    await AuthController().signIn(username, password).then((tokenUser) async {
      if (tokenUser == null) {
        CustomSnackBar.dialogMessenger(
            context, 'Tài khoản hoặc mật khẩu không đúng');
        notifyListeners();
        return;
      }
      await AuthPreferences.setToken(tokenUser['accessToken']);
      // await getCurrentUser();
      await AuthController().getCurrentUser();
      await Timer(
        Duration(seconds: 2),
        () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteManage.navigator_tab,
            (Route<dynamic> route) => false,
          );
        },
      );
      notifyListeners();
    });
  }

  Future<void> registerApp(
      BuildContext context, String username, String password) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            EditProfileScreen(editType: EditProfileType.register),
      ),
    );
    notifyListeners();
  }
}
