class ShippingAddressModel {
  late String? id;
  late String? name;
  late String? phoneNumber;
  late String? address;
  late String? note;
  late bool defaultAddress;

  ShippingAddressModel({
    this.id,
    this.name = '',
    this.phoneNumber = '',
    this.address = '',
    this.note = '',
    this.defaultAddress = false,
  });

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    address = json['address'] ?? '';
    note = json['note'] ?? '';
    defaultAddress = json['defaultAddress'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['note'] = this.note;
    data['defaultAddress'] = this.defaultAddress;
    return data;
  }
}
