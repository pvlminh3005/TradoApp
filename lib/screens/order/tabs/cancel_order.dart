import 'package:flutter/material.dart';
import '/models/order_detail_model.dart';
import '../../../widgets/order_widget/order_card.dart';

class CancelOrderWidget extends StatelessWidget {
  final List<OrderModel> cancelOrders;

  const CancelOrderWidget({
    this.cancelOrders = const [],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cancelOrders.length,
        itemBuilder: (BuildContext context, int index) {
          var order = cancelOrders[index];
          return OrderCard(
            idOrder: order.idOrder,
            date: order.date,
            quantity: order.quantity,
            total: order.totalPrice,
            status: order.statusOrder,
          );
        },
      ),
    );
  }
}
