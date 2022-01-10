import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:trado_app_uit/providers/room_provider.dart';

import '/providers/sale_order_provider.dart';
import '/providers/shipping_address_provider.dart';
import '/providers/cart_provider.dart';
import '/providers/category_provider.dart';
import '/providers/google/google_signin_controller.dart';
import '/providers/notification_provider.dart';
import '/providers/order_provider.dart';
import '/providers/rate_review_provider.dart';

class ProviderManage {
  static List<SingleChildWidget> providersApp = [
    ChangeNotifierProvider(
      create: (_) => GoogleSiginController(),
    ),
    ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => RateReviewProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => NotificationProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => OrderProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => SaleOrderProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ShippingAddressProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => RoomProvider(),
    ),
  ];
}
