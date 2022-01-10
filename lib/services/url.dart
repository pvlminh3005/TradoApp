import 'package:dio/dio.dart';
import '/utils/auth_preferences.dart';

class MainURL {
  factory MainURL() {
    return _instance;
  }
  MainURL._internal();
  static final MainURL _instance = MainURL._internal();

  static String mainURL = 'http://localhost:3000/api';

  static String headerToken = 'trado-token';
  static String account = '/account';
  static String profile = '/profile';

  static String register = '/';
  static String login = '/login';
  static String product = '/product';
  static String address = '/tagshipping';
  static String cart = 'cart';
  static String review = 'review';
  static String room = '/room';
  static String order = '/order';

  //register
  static String registerURL = '$mainURL$account$register';

  //login
  static String loginURL = '$mainURL$account$login';

  //profile
  static String profileURL = '$mainURL$profile';
  static String profileUpdateURL = '$mainURL$profile/update';

  //product
  static String productURL = '$mainURL$product';
  static String productUserURL = '$mainURL$product/user';
  static String updateProductURL = '$mainURL$product/update';
  static String productHomeURL = '$mainURL$product/home';

  //address
  static String newAddressURL = '$mainURL$address';
  static String getAddressURL = '$mainURL$address/alltag';
  static String updateAddressURL = '$mainURL$address/updatetag';
  static String defaultAddressURL = '$mainURL$address/selecttag';
  static String removeAddressURL = '$mainURL$address';

  //cart
  static String cartURL = '$mainURL$cart';

  //review
  static String newReviewURL = '$mainURL$review';
  static String userReviewURL = '$mainURL$review/user';
  static String productReviewURL = '$mainURL$review/product';

  //order
  static String createOrderURL = '$mainURL$order/create';
  static String orderIdURL = '$mainURL$order/orderid';
  static String orderBuyerURL = '$mainURL$order/orderbuyer';
  static String orderSellerURL = '$mainURL$order/orderseller';

  //review
  static String getRoomURL = '$mainURL$room';

  static Options customOption = Options(
    headers: {MainURL.headerToken: AuthPreferences.getToken() ?? ''},
  );
}
