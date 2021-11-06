import 'package:flutter/material.dart';
import 'package:trado_app_uit/screens/edit_my_category_screen.dart';
import 'package:trado_app_uit/screens/manage_my_category_screen.dart';
import '/screens/edit_info_profile_screen.dart';
import '/screens/add_shipping_address_screen.dart';
import '/screens/profile_screen.dart';
import '/screens/success_screen.dart';
import '/screens/checkout_screen.dart';
import '/screens/order_screen.dart';
import '/screens/shipping_address_screen.dart';

import '/screens/cart_screen.dart';
import '/screens/diff_profile_screen.dart';
import '/screens/rating_and_review_screen.dart';
import '/routes/navigator_tabs_route.dart';
import '/screens/category_detail_screen.dart';
import '/screens/login/signin_screen.dart';
import '../screens/login/register_screen.dart';
import '/screens/splash/splash_screen.dart';

class RouteManage {
  RouteManage._();

  static const splash = '/splash';
  static const register = '/register';
  static const signin = '/signin';
  static const navigator_tab = '/navigator_tab';
  static const category_detail = '/category_detail';
  static const cart = '/cart';
  static const diff_profile = '/diff_profile';
  static const my_profile = '/my_profile';
  static const rating_review = '/rating_review';
  static const order = '/order';
  static const checkout = '/checkout';
  static const shipping_address = '/shipping_address';
  static const add_shipping_address = '/add_shipping_address';
  static const success = '/success';
  static const edit_profile = '/edit_profile';
  static const my_category = '/my_category';
  static const edit_my_category = 'edit_my_category';

  static const initialRoute = navigator_tab;

  static Map<String, Widget Function(BuildContext)> routesApp = {
    splash: (_) => SplashScreen(),
    register: (_) => SignupScreen(),
    signin: (_) => SigninScreen(),
    navigator_tab: (_) => NavigatorTab(),
    category_detail: (_) => CategoryDetailScreen(),
    cart: (_) => CartScreen(),
    diff_profile: (_) => DiffProfileScreen(),
    my_profile: (_) => ProfileScreen(),
    rating_review: (_) => RatingAndReviewScreen(),
    order: (_) => OrderScreen(),
    checkout: (_) => CheckOutScreen(),
    shipping_address: (_) => ShippingAddressScreen(),
    add_shipping_address: (_) => AddShippingAddressScreen(),
    success: (_) => SuccessScreen(),
    edit_profile: (_) => EditProfileScreen(),
    my_category: (_) => ManageMyCategoryScreen(),
    edit_my_category: (_) => EditMyCategoryScreen(),
  };
}
