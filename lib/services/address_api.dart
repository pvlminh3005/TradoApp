import '/models/shipping_address_model.dart';

class AddressApi {
  AddressApi._();

  static Future<List<ShippingAddressModel>> fetchAddresses() async {
    try {
      List<ShippingAddressModel> data = [
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
      await Future.delayed(Duration(seconds: 3));
      return data;
    } catch (e) {
      return [];
    }
  }

  static Future<void> updateShippingAddress() async {}

  static Future<void> deleteShippingAddress() async {}
}
