import 'package:flutter/material.dart';
import '/routes/routes_manage.dart';
import '/components/loading/loading_app.dart';
import '/controllers/auth_controller.dart';
import '/models/shipping_address_model.dart';
import '/services/address_api.dart';

class ShippingAddressProvider with ChangeNotifier {
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
    _defaultAddress = _listAddresses.firstWhere(
      (address) => address.defaultAddress == true,
      orElse: () => ShippingAddressModel(),
    );
    notifyListeners();
  }

  Future<void> addNewAddress(
    BuildContext context, {
    String? name,
    String? phone,
    String? address,
    String? note,
  }) async {
    LoadingApp.LOADWAITING(title: 'Đang tạo mới...');
    ShippingAddressModel newAddress = ShippingAddressModel(
      idUser: AuthController.idUser,
      name: name,
      phoneNumber: phone,
      address: address,
      note: note,
    );
    var response = await AddressApi.createNewAddress(newAddress);

    if (response == null) {
      LoadingApp.LOADFAILED(title: 'Thêm địa chỉ thất bại');
      return;
    }
    _listAddresses.add(
      ShippingAddressModel(
        id: name,
        name: name,
        phoneNumber: phone,
        address: address,
        note: note,
      ),
    );
    LoadingApp.LOADSUCCESS(title: 'Thêm địa chỉ thành công');
    await Future.delayed(Duration(milliseconds: 1000));
    Navigator.of(context).popAndPushNamed(RouteManage.my_profile);

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
