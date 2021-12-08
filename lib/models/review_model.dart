import '/models/category_model.dart';
import '/models/user_model.dart';

class ReviewModel {
  late String? id;
  late CategoryModel? category;
  late UserModel? user;
  late String comment;
  late int stars;
  late DateTime? datePost;

  ReviewModel({
    this.id,
    this.category,
    this.user,
    this.comment = '',
    this.stars = 1,
    this.datePost,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    category = CategoryModel.fromJson(json);
    user = UserModel.fromJson(json);
    comment = json['comment'];
    stars = json['stars'];
    datePost = json['registration_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['idUser'] = this.user;
    data['idProduct'] = this.category;
    data['comment'] = this.comment;
    data['stars'] = this.stars;
    data['registration_data'] = this.datePost;

    return data;
  }
}
