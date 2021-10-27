class UserModel {
  late String? id;
  late String username;
  late String email;
  late String password;
  late DateTime? registrationData;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    this.registrationData,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    password = json['password'];
    registrationData = json['registration_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
