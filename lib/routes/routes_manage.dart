import 'package:flutter/material.dart';
import 'package:trado_app_uit/screens/order_screen.dart';

import '/screens/cart_screen.dart';
import '/screens/diff_profile_screen.dart';
import '/screens/rating_and_review_screen.dart';
import '/routes/navigator_tabs_route.dart';
import '/screens/category_detail_screen.dart';
import '/screens/login/signin_screen.dart';
import '../screens/login/register_screen.dart';
import '/screens/splash/splash_screen.dart';

class RouteManage {
  static const splash = '/splash';
  static const register = '/register';
  static const signin = '/signin';
  static const navigator_tab = '/navigator_tab';
  static const category_detail = '/category_detail';
  static const cart = '/cart';
  static const diff_profile = '/diff_profile';
  static const rating_review = '/rating_review';
  static const order = '/order';

  static const initialRoute = splash;

  static Map<String, Widget Function(BuildContext)> routesApp = {
    splash: (_) => SplashScreen(),
    register: (_) => SignupScreen(),
    signin: (_) => SigninScreen(),
    navigator_tab: (_) => NavigatorTab(),
    category_detail: (_) => CategoryDetailScreen(),
    cart: (_) => CartScreen(),
    diff_profile: (_) => DiffProfileScreen(),
    rating_review: (_) => RatingAndReviewScreen(),
    order: (_) => OrderScreen(),
  };
}