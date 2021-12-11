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
  static String _idUser = '';
  static String get idUser => _idUser;

  AuthController() {
    getCurrentUser();
  }

  static Future<void> register(
      BuildContext context, String username, String password) async {
    try {
      var response = await _dio.post(MainURL.registerURL, data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        String tokenUser = response.data['token'];
        await AuthPreferences.setToken(tokenUser);

        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteManage.edit_profile,
          (Route<dynamic> route) => false,
        );
      }
    } on DioError {
      CustomSnackBar.dialogMessenger(
        context,
        'Tài khoản này đã có người sử dụng',
      );
      return;
    }
  }

  static Future<void> signIn(
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
      await AuthController.getCurrentUser();
    } on DioError {
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
      var response = await _dio.get(
        MainURL.loginURL,
        options: MainURL.customOption,
      );

      if (response.statusCode == 200) {
        _currentUser = await UserModel.fromJson(response.data);
        _idUser = _currentUser.auth!.id!;
        return;
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  static Future checkToken() async {
    try {
      var response = await _dio.get(
        MainURL.loginURL,
        options: MainURL.customOption,
      );

      return response.data;
    } on DioError {
      return {};
    }
  }

  static Future<void> updateProfileUser() async {}
}
