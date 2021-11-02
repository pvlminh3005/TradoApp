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
      var _user = UserModel(username: username, email: '', password: password);
      var response = await _dio.post(MainURL.registerURL, data: _user.toJson());
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> signIn(String username, String password) async {
    try {
      print('signIn');
      var _user = UserModel(username: username, email: '', password: password);
      var response = await _dio.post(MainURL.loginURL, data: _user.toJson());

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await AuthPreferences.removeToken();
  }
}
