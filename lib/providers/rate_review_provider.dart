import 'package:flutter/material.dart';
import '/models/review_model.dart';
import '/services/review_api.dart';
import '../models/rate_category_model.dart';

class RateReviewProvider with ChangeNotifier {
  List<RateModel> _listRates = [
    RateModel(
      id: 'r1',
      idCategory: 'c1',
      nameUser: 'CR7',
      imageUrl:
          'https://images.unsplash.com/photo-1632624759937-7e6f17cadc9a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      date: DateTime.now(),
      comment: 'San pham tot!',
      stars: 5,
    ),
    RateModel(
      id: 'r2',
      idCategory: 'c2',
      nameUser: 'LM30',
      imageUrl:
          'https://images.unsplash.com/photo-1598121876884-f4573ed0b9f0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1lc3NpJTIwZm9vdGJhbGx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      date: DateTime.now(),
      comment: 'San pham khong giong thuc te',
      stars: 1,
    ),
  ];
  List<RateModel> get listRates => _listRates;

  Map<String, dynamic> amountRates(String idCategory) {
    List<RateModel> data = _listRates
        .where((category) => category.idCategory == idCategory)
        .toList();
    if (data.length == 0)
      return {
        'rating': 0.0,
        'review': 0,
      };
    ;
    double averageStars = data.fold(0, (amount, rate) => amount + rate.stars);
    return {
      'rating': averageStars / (data.length),
      'review': data.length,
    };
  }

  Future<List<ReviewModel>> fetchReviewByIdCategory(String idCategory) async {
    var data = await ReviewApi.fetchReviewCategory(idCategory);
    return data;
  }

  //test data
  findRateByIdCategory(String idCategory) {
    return _listRates.map((rate) => rate.idCategory == idCategory).toList();
  }

  Future<List<ReviewModel>> fetchReviewByIdUser(String idUser) async {
    var data = await ReviewApi.fetchReviewUser(idUser);
    return data;
  }
}
