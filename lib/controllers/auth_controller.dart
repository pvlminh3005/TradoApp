import 'package:dio/dio.dart';
import 'package:trado_app_uit/models/user_model.dart';
import 'package:trado_app_uit/utils/auth_preferences.dart';
import '/services/url.dart';

class AuthController {
  late Dio _dio;
  AuthController() {
    _dio = Dio();
  }

  Future<dynamic> register(String username, String password) async {
    try {
      var response = await _dio.post(MainURL.registerURL, data: {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> signIn(String username, String password) async {
    try {
      var response = await _dio.post(MainURL.loginURL, data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await AuthPreferences.removeToken();
  }

  Future getCurrentUser() async {
    try {
      String? token = AuthPreferences.getToken();
      if (token!.isEmpty) return;
      var response = await _dio.get(
        MainURL.loginURL,
        options: Options(
          headers: {MainURL.headerToken: token},
        ),
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
