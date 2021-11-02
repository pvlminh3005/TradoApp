class ShippingAddressModel {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final bool defaultAddress;

  ShippingAddressModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.address = '',
    this.defaultAddress = false,
  });
}
