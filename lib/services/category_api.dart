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

  static Future fetchCateogriesById(String id) async {
    try {
      var response = await dio.get(
        MainURL.productUserURL,
        queryParameters: {
          "idUser": id,
        },
        options: MainURL.customOption,
      );
      if (response.statusCode == 200) {
        return (response.data['product'] as List<dynamic>)
            .map((data) => CategoryModel.fromJson(data))
            .toList();
      }
    } on DioError {
      return [];
    }
  }

  static Future<List<CategoryModel>> fetchCategories() async {
    List<CategoryModel> data = [
      CategoryModel(
        id: 'c1',
        idUser: 'user1',
        title: 'Sony-Canon',
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!   Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
        price: 155000,
        imageUrl: [
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
          'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
          'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        ],
        amountView: 120,
        priceSale: 10,
        status: true,
      ),
      CategoryModel(
        id: 'c2',
        idUser: 'user1',
        title: 'Porsche 911',
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
        price: 3000000,
        imageUrl: [
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        ],
        amountView: 120,
        priceSale: 10,
        status: true,
      ),
      CategoryModel(
        id: 'c3',
        idUser: 'user2',
        title:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem',
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
        price: 60000,
        imageUrl: [
          'https://media.istockphoto.com/photos/portrait-of-a-vietnamese-girl-with-a-red-dress-in-the-lotus-hand-picture-id1187554319?k=20&m=1187554319&s=612x612&w=0&h=5l3PZl3ffXJZJbWZCkUNb5LwXRYrs4zogO3k_gdqTG8=',
        ],
        amountView: 120,
        status: true,
      ),
    ];
    await Future.delayed(Duration(seconds: 2));
    return data;
    // try {
    //   var response = await dio.get(
    //     MainURL.productURL,
    //   );

    //   return (response.data['product'] as List<dynamic>)
    //       .map((category) => CategoryModel.fromJson(category))
    //       .toList();
    // } on DioError {
    //   return [];
    // }
  }

  static Future<List<CategoryModel>> fetchFavoriteCategories() async {
    List<CategoryModel> data = [
      CategoryModel(
        id: 'c1',
        idUser: 'user1',
        title: 'Sony-Canon',
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!   Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere! Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem, eius veniam porro assumenda praesentium fugit ipsam fuga perferendis? Obcaecati maiores explicabo facere!',
        price: 155000,
        imageUrl: [
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
          'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
          'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        ],
        amountView: 120,
        priceSale: 10,
        status: true,
      ),
    ];
    await Future.delayed(Duration(seconds: 2));
    return data;
  }

  static Future<void> updateCategory(String idCategory) async {
    try {} on DioError {}
  }

  static Future<void> deleteCategory(String idCategory) async {}
}
