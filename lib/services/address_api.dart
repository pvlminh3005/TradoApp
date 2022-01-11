import 'package:dio/dio.dart';
import 'package:trado_app_uit/utils/auth_preferences.dart';
import '/controllers/auth_controller.dart';
import '/services/url.dart';
import '/models/shipping_address_model.dart';

class AddressApi {
  static final Dio dio = Dio();
  factory AddressApi() {
    return _instance;
  }

  AddressApi._internal();
  static final AddressApi _instance = AddressApi._internal();

  static Future<List<ShippingAddressModel>> fetchAddresses() async {
    try {
      String idUser = AuthController.idUser;

      var response = await dio.get(
        MainURL.getAddressURL,
        queryParameters: {'idUser': idUser},
        options: Options(
          headers: {MainURL.headerToken: AuthPreferences.getToken()},
        ),
      );

      if (response.statusCode == 200) {
        return (response.data['tagshipping'] as List)
            .map((data) => ShippingAddressModel.fromJson(data))
            .toList();
      }
      return [];
    } on DioError {
      return [];
    }
  }

  static Future createNewAddress(ShippingAddressModel address) async {
    try {
      var response = await dio.post(
        MainURL.newAddressURL,
        data: address.toJson(),
        options: MainURL.customOption,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError {
      return null;
    }
  }

  static Future updateShippingAddress(ShippingAddressModel address) async {
    try {
      var response = await dio.post(
        MainURL.updateAddressURL,
        data: address.toJson(),
        options: MainURL.customOption,
      );

      if (response.statusCode == 200) return response.data;
    } on DioError {
      return null;
    }
  }

  static Future<void> deleteShippingAddress(String idAddress) async {
    try {
      await dio.delete(
        MainURL.removeAddressURL,
        queryParameters: {"idTag": idAddress},
        options: MainURL.customOption,
      );
    } on DioError {
      return;
    }
  }

  static Future<void> changeDefaultAddress(String idTag) async {
    try {
      await dio.post(
        MainURL.defaultAddressURL,
        data: {'idTag': idTag},
        options: MainURL.customOption,
      );
    } on DioError {
      return;
    }
  }
}

List<ShippingAddressModel> fakeData = [
  ShippingAddressModel(
    id: 'sa1',
    name: 'Le Minh Pham',
    phoneNumber: '(+84) 123456789',
    address: 'Nha xx, Duong xx, Quan XX, Tp XX, Tinh XX',
    note: 'Khi toi goi dien vao so 09xxxxxxx',
    defaultAddress: true,
  ),
  ShippingAddressModel(
    id: 'sa2',
    name: 'Ha Nhat Linh',
    phoneNumber: '(+84) 987654321',
    address: 'Nha xx, Duong xx, Quan XX, Tp XX, Tinh XX,',
    note: 'Khi toi goi dien vao so 09xxxxxxx',
    defaultAddress: false,
  ),
  ShippingAddressModel(
    id: 'sa3',
    name: 'Tu Quyen',
    phoneNumber: '(+84) 123456789',
    address:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Semper mi magna justo, orci. Amet quis tincidunt lectus purus. Congue diam id id ut dignissim pellentesque tortor consectetur. Duis ornare eu mi vitae ac sagittis vitae porta platea.',
    defaultAddress: false,
  ),
];
