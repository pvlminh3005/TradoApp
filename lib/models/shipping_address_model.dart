class ShippingAddressModel {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? note;
  final bool defaultAddress;

  ShippingAddressModel({
    this.id,
    this.name = '',
    this.phoneNumber = '',
    this.address = '',
    this.note = '',
    this.defaultAddress = false,
  });
}
