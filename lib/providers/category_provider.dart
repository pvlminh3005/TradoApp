import 'package:flutter/material.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import '/models/category_model.dart';
import '/services/category_api.dart';

class CategoryProvider with ChangeNotifier {
  CategoryProvider() {
    fetchAllCategories();
  }

  List<CategoryModel> _listFavoriteCategories = [];
  List<CategoryModel> get listFavoriteCategories => _listFavoriteCategories;

  List<CategoryModel> _listCategories = [];
  List<CategoryModel> get listCategories => _listCategories;

  List<CategoryModel> _listMyCategories = [];
  List<CategoryModel> get listMyCategories => _listMyCategories;

  int _totalCategories = 0;
  int get totalCategories => _totalCategories;
  int page = 1;
  bool isLoading = false;

  Future<void> createCategory({
    required String idUser,
    required String title,
    required String description,
    required int price,
    required int priceSale,
    required List<dynamic> imageUrl,
    required int quantity,
    required bool status,
  }) async {
    var data = CategoryModel(
      idUser: idUser,
      title: title,
      description: description,
      price: price,
      priceSale: priceSale,
      imageUrl: imageUrl,
      quantity: quantity,
      status: status,
    );

    await CategoryApi.createNewCategory(data);
    _listMyCategories.add(data);
    notifyListeners();
  }

  Future<void> fetchAllCategories() async {
    _listCategories = await CategoryApi.fetchAllCategories(page: page);
    notifyListeners();
  }

  CategoryModel findCategoryById(String id) {
    return _listCategories.firstWhere((category) => category.id == id);
  }

  Future<void> fetchAllCategoriesMyUser() async {
    String? idUser = AuthController.idUser;
    var data = await CategoryApi.fetchCateogriesById(idUser);
    _listMyCategories = data;
    _totalCategories = data.length;
    notifyListeners();
  }

  Future<void> fetchAllFavoriteCategories() async {
    _listFavoriteCategories = await CategoryApi.fetchFavoriteCategories();
    notifyListeners();
  }

  Future<void> addCategoryToFavorite(CategoryModel category) async {
    var data =
        await _listFavoriteCategories.where((data) => data.id == category.id);
    if (data.isNotEmpty) {
      return;
    } else {
      _listFavoriteCategories.add(category);
    }
    notifyListeners();
  }

  Future fetchCategoriesById(String id) async {
    return await CategoryApi.fetchCateogriesById(id);
  }

  Future<void> fetchCagetoriesDelivered() async {}

  Future fetchLoadMoreCategories() async {
    var data = await CategoryApi.fetchAllCategories(page: ++page);
    listCategories.addAll(data);
    notifyListeners();
  }
}
