import 'package:trado_app_uit/models/shipping_address_model.dart';

class AddressApi {
  AddressApi._();

  static Future<List<ShippingAddressModel>> fetchAddresses() async {
    List<ShippingAddressModel> data = [
      ShippingAddressModel(
        id: 'sa1',
        name: 'Le Minh Pham',
        phoneNumber: '(+84) 123456789',
        address: 'Nha xx, Duong xx, Quan XX, Tp XX, Tinh XX',
        defaultAddress: true,
      ),
      ShippingAddressModel(
        id: 'sa2',
        name: 'Ha Nhat Linh',
        phoneNumber: '(+84) 987654321',
        address: 'Nha xx, Duong xx, Quan XX, Tp XX, Tinh XX',
        defaultAddress: false,
      ),
      ShippingAddressModel(
        id: 'sa1',
        name: 'Tu Quyen',
        phoneNumber: '(+84) 123456789',
        address: 'Nha yy, Duong yy, Quan YY, Tp YYY, Tinh YYY',
        defaultAddress: false,
      ),
    ];
    return data;
  }
}
