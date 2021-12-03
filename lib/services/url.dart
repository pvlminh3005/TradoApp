import 'package:dio/dio.dart';
import 'package:trado_app_uit/utils/auth_preferences.dart';

class MainURL {
  MainURL._();

  static String mainURL = 'http://localhost:3000/api';

  static String headerToken = 'trado-token';
  static String account = '/account';
  static String register = '/';
  static String login = '/login';
  static String product = '/product';
  static String address = '/tagshipping';
  static String cart = 'cart';

  //register
  static String registerURL = '$mainURL$account$register';

  //login
  static String loginURL = '$mainURL$account$login';

  //product
  static String productURl = '$mainURL$product';
  static String productUserURL = '$mainURL$product/user';

  //address
  static String newAddressURL = '$mainURL$address';
  static String getAddressURL = '$mainURL$address/alltag';
  static String updateAddressURL = '$mainURL$address/updatetag';
  static String defaultAddressURL = '$mainURL$address/selecttag';
  static String removeAddressURL = '$mainURL$address';

  //cart
  static String cartURL = '$mainURL$cart';

  static Options customOption = Options(
    headers: {MainURL.headerToken: AuthPreferences.getToken()},
  );
}
