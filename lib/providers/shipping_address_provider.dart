import 'package:flutter/material.dart';
import '/models/shipping_address_model.dart';
import '/services/address_api.dart';

class ShippingAddressProvider with ChangeNotifier {
  ShippingAddressProvider() {
    fetchAllAddresses();
  }

  List<ShippingAddressModel> _listAddresses = [];
  List<ShippingAddressModel> get listAddresses => _listAddresses;

  late ShippingAddressModel _defaultAddress;
  ShippingAddressModel get defaultAddress => _defaultAddress;

  Future<void> fetchAllAddresses() async {
    _listAddresses = await AddressApi.fetchAddresses();
    fetchDefaultAddress();
    notifyListeners();
  }

  void fetchDefaultAddress() {
    _defaultAddress =
        _listAddresses.firstWhere((address) => address.defaultAddress == true);
    notifyListeners();
  }

  Future<void> addNewAddress(
      {String? name, String? phone, String? address, String? note = ''}) async {
    await Future.delayed(Duration(seconds: 2));
    _listAddresses.add(
      ShippingAddressModel(
        id: name,
        name: name,
        phoneNumber: phone,
        address: address,
        note: note,
      ),
    );
    notifyListeners();
  }

  Future<void> removeAddress(String id) async {
    await Future.delayed(Duration(seconds: 2));
    _listAddresses.removeWhere((address) => address.id == id);
    notifyListeners();
  }

  void setDefaultAddress(String? idAddress) {
    _listAddresses.forEach((address) {
      if (address.id == idAddress) {
        address.defaultAddress = true;
        return;
      }
      address.defaultAddress = false;
    });

    notifyListeners();
  }
}
