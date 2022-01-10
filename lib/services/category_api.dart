import 'package:dio/dio.dart';
import '/models/category_model.dart';
import '/services/url.dart';
import '/utils/auth_preferences.dart';

class CategoryApi {
  static final Dio dio = Dio();
  factory CategoryApi() {
    return _instance;
  }

  CategoryApi._internal();
  static final CategoryApi _instance = CategoryApi._internal();

  static Future<dynamic> createNewCategory(CategoryModel category) async {
    try {
      String? token = AuthPreferences.getToken();
      if (token!.isEmpty) return;
      var response = await dio.post(
        MainURL.productURL,
        data: category.toJson(),
        options: Options(
          headers: {MainURL.headerToken: token},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<CategoryModel>> fetchAllCategories({int page = 1}) async {
    try {
      var response = await dio.get(MainURL.productHomeURL, queryParameters: {
        'page': page,
      });

      if (response.statusCode == 200) {
        return List<CategoryModel>.from(
          (response.data['product'] as List)
              .map((category) => CategoryModel.fromJson(category)),
        );
      }
      return [];
    } on DioError {
      return [];
    }
  }

  static Future<List<CategoryModel>> fetchCateogriesById(String id) async {
    try {
      var response = await dio
          .get(MainURL.productUserURL, queryParameters: {'idUser': id});
      if (response.statusCode == 200) {
        return (response.data['product'] as List)
            .map((category) => CategoryModel.fromJson(category))
            .toList();
      }
      return [];
    } on DioError {
      return [];
    }
  }

  static Future<List<CategoryModel>> fetchFavoriteCategories() async {
    List<CategoryModel> data = [
      // CategoryModel(
      //   id: 'c1',
      //   idUser: 'user1',
      //   title: 'Sony-Canon',
      //   description:
      //       'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!   Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
      //   price: 155000,
      //   imageUrl: [
      //     'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      //     'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      //     'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      //   ],
      //   amountView: 120,
      //   priceSale: 10,
      //   status: true,
      // ),
    ];
    await Future.delayed(Duration(seconds: 2));
    return data;
  }

  static Future updateCategory(Map<String, dynamic> data) async {
    try {
      print('updating---');
      var response = await dio.post(
        MainURL.updateProductURL,
        data: data,
        options: MainURL.customOption,
      );
      print(response.data['product']);
      if (response.statusCode == 200) {
        return response.data['product'];
      }
      return null;
    } on DioError {
      return null;
    }
  }

  static Future<void> deleteCategory(String idCategory) async {}
}
