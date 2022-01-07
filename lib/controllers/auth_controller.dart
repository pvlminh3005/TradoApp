import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import '/utils/conver_scaffold_messenger.dart';
import '/routes/routes_manage.dart';
import '/models/user_model.dart';
import '/utils/auth_preferences.dart';
import '/services/url.dart';

class AuthController {
  factory AuthController() {
    return _instance;
  }
  AuthController._internal();
  static final AuthController _instance = AuthController._internal();

  static late Dio _dio = Dio();
  static late UserModel currentUser;
  static String _idUser = '';
  static String get idUser => _idUser;

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
        backgroundColor: Colors.red.shade400,
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
      await AuthController.getCurrentUser();

      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteManage.navigator_tab,
        (Route<dynamic> route) => false,
      );
    } on DioError {
      CustomSnackBar.dialogMessenger(
        context,
        'Tài khoản hoặc mật khẩu không đúng',
        backgroundColor: Colors.red.shade400,
      );
      return;
    }
  }

  static Future<void> signOut() async {
    await AuthPreferences.removeToken();
  }

  static Future getUserById(String id) async {
    try {
      var response = await _dio.get(
        MainURL.profileURL,
        queryParameters: {'idUser': id},
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data['profile'][0]);
      }
      return UserModel();
    } on DioError {
      return UserModel();
    }
  }

  static Future<void> getCurrentUser() async {
    try {
      var response = await _dio.get(
        MainURL.loginURL,
        options: Options(
          headers: {MainURL.headerToken: AuthPreferences.getToken() ?? ''},
        ),
      );
      currentUser = await UserModel.fromJson(response.data['profile']);
      _idUser = currentUser.auth!.id!;
      return;
    } on DioError {
      return;
    }
  }

  static Future checkToken() async {
    try {
      var response = await _dio.get(
        MainURL.loginURL,
        options: MainURL.customOption,
      );

      return response.data['msg'];
    } on DioError {
      return 'Error';
    }
  }

  static Future<void> updateProfileUser(UserModel data) async {
    try {
      await _dio.put(
        MainURL.profileUpdateURL,
        data: data.toJson(),
        options: MainURL.customOption,
      );
      await AuthController.getCurrentUser();
    } on DioError {
      return null;
    }
  }
}
