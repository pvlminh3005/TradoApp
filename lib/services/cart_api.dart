import 'package:dio/dio.dart';
import '/models/cart_model.dart';
import '/services/url.dart';

class CartApi {
  static final Dio dio = Dio();
  factory CartApi() {
    return _instance;
  }

  CartApi._internal();
  static final CartApi _instance = CartApi._internal();

  static Future<void> addCategoryToCart(CartModel cart) async {
    try {
      var response = await dio.post(MainURL.cart);
    } on DioError {}
  }

  static Future<void> removeCategoryInCart(String key) async {}
}
