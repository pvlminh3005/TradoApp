class ShippingAddressModel {
  late String? id;
  late String? idUser;
  late String? name;
  late String? phoneNumber;
  late String? address;
  late String? note;
  late bool defaultAddress;

  ShippingAddressModel({
    this.id,
    this.idUser,
    this.name = '',
    this.phoneNumber = '',
    this.address = '',
    this.note = '',
    this.defaultAddress = false,
  });

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    idUser = json['idUser'] ?? '';
    name = json['name'] ?? '';
    phoneNumber = json['phone'] ?? '';
    address = json['address'] ?? '';
    note = json['note'] ?? '';
    defaultAddress = json['select'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTag'] = this.id;
    data['idUser'] = this.idUser;
    data['name'] = this.name;
    data['phone'] = this.phoneNumber;
    data['address'] = this.address;
    data['note'] = this.note;
    data['select'] = this.defaultAddress;
    return data;
  }
}
