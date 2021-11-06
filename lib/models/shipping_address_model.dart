class ShippingAddressModel {
  final String? id;
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
}
