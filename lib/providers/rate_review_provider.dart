import 'package:flutter/material.dart';
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

  List<RateModel> findRateByIdCategory(String idCategory) {
    return _listRates
        .where((category) => category.idCategory == idCategory)
        .toList();
  }

  // List<RateModel> findRateByIdUser(String idUser){

  // }
}
