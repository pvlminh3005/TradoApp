import 'package:flutter/material.dart';
import '/screens/review/write_review_screen.dart';
import '../screens/dashboard/home_screen.dart';
import '../screens/sale_order/sale_chart_screen.dart';
import '../screens/category/edit_my_category_screen.dart';
import '../screens/category/manage_my_category_screen.dart';
import '../screens/order/order_detail_screen.dart';
import '../screens/sale_order/sale_order_screen.dart';
import '../screens/profile/edit_info_profile_screen.dart';
import '../screens/shipping_address/add_shipping_address_screen.dart';
import '../screens/dashboard/profile_screen.dart';
import '../screens/payment_order/success_screen.dart';
import '../screens/payment_order/checkout_screen.dart';
import '../screens/order/order_screen.dart';
import '../screens/shipping_address/shipping_address_screen.dart';

import '../screens/payment_order/cart_screen.dart';
import '../screens/profile/diff_profile_screen.dart';
import '../screens/review/rating_and_review_screen.dart';
import '/routes/navigator_tabs_route.dart';
import '../screens/category/category_detail_screen.dart';
import '/screens/login/signin_screen.dart';
import '../screens/login/register_screen.dart';
import '/screens/splash/splash_screen.dart';

class RouteManage {
  RouteManage._();

  static const splash = '/splash';
  static const register = '/register';
  static const signin = '/signin';
  static const navigator_tab = '/navigator_tab';
  static const home = '/home';
  static const category_detail = '/category_detail';
  static const cart = '/cart';
  static const diff_profile = '/diff_profile';
  static const my_profile = '/my_profile';
  static const rating_review = '/rating_review';
  static const write_review = '/write_review';
  static const order = '/order';
  static const order_detail = 'order_detail';
  static const sale_order = '/sale_order';
  static const sale_chart = '/sale_chart';
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
    home: (_) => HomeScreen(),
    category_detail: (_) => CategoryDetailScreen(),
    cart: (_) => CartScreen(),
    diff_profile: (_) => DiffProfileScreen(),
    my_profile: (_) => ProfileScreen(),
    rating_review: (_) => RatingAndReviewScreen(),
    write_review: (_) => WriteReviewScreen(),
    order: (_) => OrderScreen(),
    order_detail: (_) => OrderDetailScreen(),
    sale_order: (_) => SaleOrderScreen(),
    sale_chart: (_) => SaleChartScreen(),
    checkout: (_) => CheckOutScreen(),
    shipping_address: (_) => ShippingAddressScreen(),
    add_shipping_address: (_) => AddShippingAddressScreen(),
    success: (_) => SuccessScreen(),
    edit_profile: (_) => EditProfileScreen(),
    my_category: (_) => ManageMyCategoryScreen(),
    edit_my_category: (_) => EditMyCategoryScreen(),
  };
}
