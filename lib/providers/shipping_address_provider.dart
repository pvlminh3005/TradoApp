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
    await fetchAllAddresses();

    LoadingApp.LOADSUCCESS(title: 'Thêm địa chỉ thành công');
    await Future.delayed(Duration(milliseconds: 1000));
    Navigator.of(context).popAndPushNamed(RouteManage.my_profile);

    notifyListeners();
  }

  Future<void> removeAddress(String id) async {
    LoadingApp.LOADWAITING();
    int index = _listAddresses.indexWhere((address) => address.id == id);
    await AddressApi.deleteShippingAddress(id);

    if (_listAddresses[index].defaultAddress == true) {
      await setDefaultAddress(_listAddresses[0].id);
      _listAddresses[0].defaultAddress == true;
    }
    _listAddresses.removeAt(index);

    LoadingApp.LOADSUCCESS(
      title: 'Xoá địa chỉ thành công',
      seconds: 2,
    );

    notifyListeners();
  }

  Future<void> updateAddress(
    BuildContext context, {
    String? idTag,
    String? name,
    String? phone,
    String? address,
    String? note,
  }) async {
    LoadingApp.LOADWAITING();
    int index = _listAddresses.indexWhere((address) => address.id == idTag);

    var newAddress = ShippingAddressModel(
      id: idTag,
      idUser: AuthController.idUser,
      name: name,
      phoneNumber: phone,
      address: address,
      note: note,
      defaultAddress: _listAddresses[index].defaultAddress,
    );

    var response = await AddressApi.updateShippingAddress(newAddress);
    if (response == null) {
      LoadingApp.LOADFAILED(title: 'Cập nhật địa chỉ thất bại!');
      return;
    } else {
      // success
      _listAddresses[index] = newAddress;
      LoadingApp.LOADSUCCESS(title: 'Cập nhật địa chỉ thành công!');
      Navigator.pop(context, true);
    }

    notifyListeners();
  }

  Future<void> setDefaultAddress(String? idAddress) async {
    _listAddresses.forEach((address) async {
      if (address.id == idAddress) {
        address.defaultAddress = true;
        await AddressApi.changeDefaultAddress(idAddress!);
        return;
      }
      address.defaultAddress = false;
    });

    fetchDefaultAddress();

    notifyListeners();
  }
}
