class UserModel {
  AuthModel? auth;
  String? name;
  int? countStar;
  int? feedBack;
  int? countSell;
  int? countBuy;
  String? registrationData;

  UserModel({
    this.auth,
    this.name,
    this.countStar,
    this.feedBack,
    this.countSell,
    this.countBuy,
    this.registrationData,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    auth = json['_id'] != null ? new AuthModel.fromJson(json['_id']) : null;
    name = json['name'] ?? '';
    countStar = json['count_star'] ?? '';
    feedBack = json['feed_back'] ?? '';
    countSell = json['count_sell'] ?? '';
    countBuy = json['count_buy'] ?? '';
    registrationData = json['registration_data'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auth != null) {
      data['_id'] = this.auth!.toJson();
    }
    data['name'] = this.name;
    data['count_star'] = this.countStar;
    data['feed_back'] = this.feedBack;
    data['count_sell'] = this.countSell;
    data['count_buy'] = this.countBuy;
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
