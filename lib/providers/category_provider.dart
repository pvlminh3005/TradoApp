import 'package:flutter/material.dart';
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

  Future<void> fetchAllCategories() async {
    _listCategories = await CategoryApi.fetchCategories();
    notifyListeners();
  }

  CategoryModel findCategoryById(String id) {
    return _listCategories.firstWhere((category) => category.id == id);
  }

  List<CategoryModel> fetchAllCategoriesByUser(String? idUser) {
    return _listCategories
        .where((category) => category.idUser == idUser)
        .toList();
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
}
