import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  static SharedPreferences? preferences;
  static const _keyToken = '';

  static Future init() async =>
      preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await preferences?.setString(_keyToken, token);

  static String? getToken() => preferences?.getString(_keyToken);

  static Future removeToken() async => await preferences?.remove(_keyToken);
}
