import 'package:dio/dio.dart';

class FavoriteApi {
  static final Dio dio = Dio();
  factory FavoriteApi() {
    return _instance;
  }

  FavoriteApi._internal();
  static final FavoriteApi _instance = FavoriteApi._internal();

  static Future<void> addToFavorite() async {}

  static Future<void> removeCategoryFavorite() async {
    try {} on DioError {}
  }
}
