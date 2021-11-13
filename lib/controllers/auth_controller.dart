import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/utils/conver_scaffold_messenger.dart';
import '/routes/routes_manage.dart';
import '/models/user_model.dart';
import '/utils/auth_preferences.dart';
import '/services/url.dart';

class AuthController {
  static late Dio _dio = Dio();
  static late UserModel _currentUser;
  static UserModel get currentUser => _currentUser;

  AuthController() {
    getCurrentUser();
  }

  static Future<dynamic> register(
      BuildContext context, String username, String password) async {
    try {
      var response = await _dio.post(MainURL.registerURL, data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  static Future<dynamic> signIn(
      BuildContext context, String username, String password) async {
    try {
      var response = await _dio.post(
        MainURL.loginURL,
        data: {
          'username': username,
          'password': password,
        },
      );

      String tokenUser = response.data['accessToken'];
      await AuthPreferences.setToken(tokenUser);

      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteManage.navigator_tab,
        (Route<dynamic> route) => false,
      );
    } on DioError catch (e) {
      CustomSnackBar.dialogMessenger(
          context, 'Tài khoản hoặc mật khẩu không đúng');
      return;
    }
  }

  static Future<void> signOut() async {
    await AuthPreferences.removeToken();
  }

  static Future<void> getCurrentUser() async {
    try {
      String? token = await AuthPreferences.getToken();
      if (token!.isEmpty) return;
      var response = await _dio.get(
        MainURL.loginURL,
        options: Options(
          headers: {MainURL.headerToken: token},
        ),
      );

      if (response.statusCode == 200) {
        _currentUser = await UserModel.fromJson(response.data);
        print(_currentUser);
        return;
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
