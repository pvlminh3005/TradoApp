class UserModel {
  AuthModel? auth;
  String? name;
  String? idCard;
  String? phoneNumber;
  String? address;
  String? email;
  String? imageUrl;
  late double countPerStars;
  late int countRating;
  int? feedBack;
  late int countSell;
  late int countBuy;
  late int fame;
  String? registrationData;

  UserModel({
    this.auth,
    this.name,
    this.idCard,
    this.phoneNumber,
    this.address,
    this.email,
    this.imageUrl,
    this.countPerStars = 0,
    this.countRating = 0,
    this.feedBack,
    this.countSell = 0,
    this.countBuy = 0,
    this.fame = 0,
    this.registrationData,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    auth = json['_id'] != null ? new AuthModel.fromJson(json['_id']) : null;
    name = json['name'] ?? '';
    idCard = json['id_card'] ?? '';
    phoneNumber = json['phone_umber'] ?? '';
    address = json['address'] ?? '';
    email = json['email'] ?? '';
    imageUrl = json['image'] ?? '';
    countPerStars = json['count_per_star'] ?? 0;
    countRating = json['count_rating'] ?? 0;
    feedBack = json['feed_back'] ?? '';
    countSell = json['count_sell'] ?? 0;
    countBuy = json['count_buy'] ?? 0;
    fame = json['fame'] ?? 0;
    registrationData = json['registration_data'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auth != null) {
      data['_id'] = this.auth!.toJson();
    }
    data['name'] = this.name;
    data['verify'] = this.idCard;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    data['image'] = this.imageUrl;
    data['count_per_star'] = this.countPerStars;
    data['count_rating'] = this.countRating;
    data['feed_back'] = this.feedBack;
    data['count_sell'] = this.countSell;
    data['count_buy'] = this.countBuy;
    data['fame'] = this.fame;
    data['registration_data'] = this.registrationData;
    return data;
  }
}

class AuthModel {
  String? id;
  String? username;
  String? registrationData;

  AuthModel({
    this.id,
    this.username,
    this.registrationData,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    username = json['username'] ?? '';
    registrationData = json['registration_data'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['username'] = this.username;
    data['registration_data'] = this.registrationData;
    return data;
  }
}
