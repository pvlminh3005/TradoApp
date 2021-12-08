import 'package:dio/dio.dart';
import '/models/review_model.dart';
import '/services/url.dart';

class ReviewApi {
  static final Dio dio = Dio();

  static final ReviewApi _instance = ReviewApi._internal();
  factory ReviewApi() {
    return _instance;
  }

  ReviewApi._internal();

  static Future createNewReview(ReviewModel review) async {
    try {
      await dio.post(
        MainURL.newReviewURL,
        data: review.toJson(),
        options: MainURL.customOption,
      );
    } on DioError {
      return;
    }
  }

  static Future fetchReviewCategory(String idCategory) async {
    try {
      var response = await dio.get(
        MainURL.productReviewURL,
        queryParameters: {'idProduct': idCategory},
      );
      if (response.statusCode == 200) {
        return response.data['review'];
      }
    } on DioError {
      return [];
    }
  }

  static Future fetchReviewUser(String idUser) async {
    try {
      var response = await dio.get(
        MainURL.userReviewURL,
        queryParameters: {'idUser': idUser},
      );
      if (response.statusCode == 200) {
        return response.data['review'];
      }
    } on DioError {
      return [];
    }
  }
}
