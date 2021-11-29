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

  int _totalCategories = 0;
  int get totalCategories => _totalCategories;

  Future<void> fetchAllCategories() async {
    _listCategories = await CategoryApi.fetchCategories();
    notifyListeners();
  }

  CategoryModel findCategoryById(String id) {
    return _listCategories.firstWhere((category) => category.id == id);
  }

  Future<void> fetchAllCategoriesMyUser() async {
    String? idUser = AuthController.currentUser.auth!.id;
    var data = await CategoryApi.fetchCateogriesById(idUser!);
    _listCategories.addAll(data);
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

  Future<void> fetchCagetoriesDelivered() async {}
}
