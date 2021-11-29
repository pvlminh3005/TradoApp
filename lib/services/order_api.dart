import 'package:dio/dio.dart';

import '/models/category_model.dart';
import '../models/order_detail_model.dart';
import '/models/shipping_address_model.dart';

class OrderApi {
  static final Dio dio = Dio();
  factory OrderApi() {
    return _instance;
  }

  OrderApi._internal();
  static final OrderApi _instance = OrderApi._internal();

  static Future<List<OrderModel>> fetchAllMyOrders() async {
    try {
      List<OrderDetailModel> data = [
        OrderDetailModel(
          id: 'order1',
          idUser: 'user1',
          address: ShippingAddressModel(
            id: 'sa1',
            name: 'Le Minh Pham',
            phoneNumber: '(+84) 123456789',
            address: 'Nha xx, Duong xx, Quan XX, Tp XX, Tinh XX',
            note: 'Khi toi goi dien vao so 09xxxxxxx',
            defaultAddress: true,
          ),
          totalPrice: 300.500,
          categories: [
            CategoryModel(
              id: 'c1',
              idUser: 'user1',
              title: 'Sony-Canon',
              price: 155000,
              imageUrl: [
                'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
              ],
              quantity: 2,
            ),
          ],
          statusOrder: 1,
          quantityCategories: 1,
          time: TimeOrderModel(
            timeDelivery: DateTime.now(),
            timeFinish: DateTime.now(),
            timeOrder: DateTime.now(),
          ),
        ),
        OrderDetailModel(
          id: 'order2',
          idUser: 'user1',
          address: ShippingAddressModel(
            id: 'sa3',
            name: 'Tu Quyen',
            phoneNumber: '(+84) 123456789',
            address:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Semper mi magna justo, orci. Amet quis tincidunt lectus purus. Congue diam id id ut dignissim pellentesque tortor consectetur. Duis ornare eu mi vitae ac sagittis vitae porta platea.',
          ),
          totalPrice: 300.500,
          categories: [
            CategoryModel(
              id: 'c3',
              idUser: 'user2',
              title:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem',
              price: 60000,
              imageUrl: [
                'https://media.istockphoto.com/photos/portrait-of-a-vietnamese-girl-with-a-red-dress-in-the-lotus-hand-picture-id1187554319?k=20&m=1187554319&s=612x612&w=0&h=5l3PZl3ffXJZJbWZCkUNb5LwXRYrs4zogO3k_gdqTG8=',
              ],
              quantity: 1,
            ),
            CategoryModel(
              id: 'c1',
              idUser: 'user1',
              title: 'Sony-Canon',
              price: 155000,
              imageUrl: [
                'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
              ],
              quantity: 2,
            ),
          ],
          statusOrder: 2,
          time: TimeOrderModel(
            timeDelivery: DateTime.now(),
            timeFinish: DateTime.now(),
            timeOrder: DateTime.now(),
          ),
        )
      ];
      var convertData = data
          .map((order) => OrderModel(
                idOrder: order.id,
                idUser: order.idUser,
                totalPrice: order.totalPrice,
                quantity: order.quantityCategories,
                statusOrder: order.statusOrder,
                date: order.time.timeOrder,
              ))
          .toList();
      await Future.delayed(Duration(seconds: 3));
      return convertData;
    } catch (e) {
      return [];
    }
  }

  static Future<List<OrderDetailModel>> fetchAllSaleOrders() async {
    try {
      List<OrderDetailModel> data = [
        OrderDetailModel(
          id: 'order3',
          idUser: 'user1',
          name: 'Le Minh',
          address: ShippingAddressModel(
            id: 'sa1',
            name: 'Le Minh Pham',
            phoneNumber: '(+84) 123456789',
            address: 'Nha xx, Duong xx, Quan XX, Tp XX, Tinh XX',
            note: 'Khi toi goi dien vao so 09xxxxxxx',
          ),
          totalPrice: 300500,
          categories: [
            CategoryModel(
              id: 'c1',
              idUser: 'user1',
              title: 'Sony-Canon',
              price: 155000,
              imageUrl: [
                'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
              ],
              quantity: 2,
            ),
          ],
          quantityCategories: 1,
          time: TimeOrderModel(
            timeDelivery: DateTime.now(),
            timeFinish: DateTime.now(),
            timeOrder: DateTime.now(),
          ),
          statusOrder: 0,
        ),
        OrderDetailModel(
          id: 'order4',
          idUser: 'user1',
          name: 'Tu Quyen',
          address: ShippingAddressModel(
            id: 'sa3',
            name: 'Tu Quyen',
            phoneNumber: '(+84) 123456789',
            address:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Semper mi magna justo, orci. Amet quis tincidunt lectus purus. Congue diam id id ut dignissim pellentesque tortor consectetur. Duis ornare eu mi vitae ac sagittis vitae porta platea.',
          ),
          totalPrice: 80000,
          categories: [
            CategoryModel(
              id: 'c3',
              idUser: 'user2',
              title:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem',
              price: 60000,
              imageUrl: [
                'https://media.istockphoto.com/photos/portrait-of-a-vietnamese-girl-with-a-red-dress-in-the-lotus-hand-picture-id1187554319?k=20&m=1187554319&s=612x612&w=0&h=5l3PZl3ffXJZJbWZCkUNb5LwXRYrs4zogO3k_gdqTG8=',
              ],
              quantity: 1,
            ),
            CategoryModel(
              id: 'c1',
              idUser: 'user1',
              title: 'Sony-Canon',
              price: 155000,
              imageUrl: [
                'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
              ],
              quantity: 2,
            ),
          ],
          quantityCategories: 2,
          time: TimeOrderModel(
            timeDelivery: DateTime.now(),
            timeFinish: DateTime.now(),
            timeOrder: DateTime.now(),
          ),
          statusOrder: 1,
        ),
      ];
      await Future.delayed(Duration(seconds: 3));
      return data;
    } catch (e) {
      return [];
    }
  }

  static Future fetchOrderDetailById(String id) async {
    try {
      OrderDetailModel data = OrderDetailModel(
        id: 'order4',
        idUser: 'user1',
        name: 'Tu Quyen',
        address: ShippingAddressModel(
          id: 'sa3',
          name: 'Tu Quyen',
          phoneNumber: '(+84) 123456789',
          address:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Semper mi magna justo, orci. Amet quis tincidunt lectus purus. Congue diam id id ut dignissim pellentesque tortor consectetur. Duis ornare eu mi vitae ac sagittis vitae porta platea.',
        ),
        totalPrice: 80000,
        categories: [
          CategoryModel(
            id: 'c3',
            idUser: 'user2',
            title:
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, error facere! Temporibus aperiam velit, ipsum doloremque voluptatem',
            price: 60000,
            imageUrl: [
              'https://media.istockphoto.com/photos/portrait-of-a-vietnamese-girl-with-a-red-dress-in-the-lotus-hand-picture-id1187554319?k=20&m=1187554319&s=612x612&w=0&h=5l3PZl3ffXJZJbWZCkUNb5LwXRYrs4zogO3k_gdqTG8=',
            ],
            quantity: 1,
          ),
          CategoryModel(
            id: 'c1',
            idUser: 'user1',
            title: 'Sony-Canon',
            price: 155000,
            imageUrl: [
              'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
              'https://images.unsplash.com/photo-1596756003714-9a02b585a1a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2Fub258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
              'https://images.unsplash.com/photo-1603208235561-006b83924146?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhbm9ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
            ],
            quantity: 2,
          ),
        ],
        time: TimeOrderModel(
          timeDelivery: DateTime.now(),
          timeFinish: DateTime.now(),
          timeOrder: DateTime.now(),
        ),
        statusOrder: 1,
      );
      await Future.delayed(Duration(seconds: 3));
      return data;
    } catch (e) {}
  }
}
