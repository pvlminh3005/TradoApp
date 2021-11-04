import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/shipping_address_model.dart';
import 'package:trado_app_uit/services/address_api.dart';

class ShippingAddressProvider with ChangeNotifier {
  ShippingAddressProvider() {
    fetchAllAddresses();
  }

  List<ShippingAddressModel> _listAddresses = [];
  List<ShippingAddressModel> get listAddresses => _listAddresses;

  Future<void> fetchAllAddresses() async {
    _listAddresses = await AddressApi.fetchAddresses();
    notifyListeners();
  }

  // void changeDefaultAddress(String id) {
  //   _listAddresses.
  // }

  Future<void> addNewAddress(
      {String? name, String? phone, String? address, String? note = ''}) async {
    await Future.delayed(Duration(seconds: 2));
    print(name);
    _listAddresses.add(
      ShippingAddressModel(
        name: name,
        phoneNumber: phone,
        address: address,
        note: note,
      ),
    );
    notifyListeners();
  }
}
