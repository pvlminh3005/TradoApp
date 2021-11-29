import 'package:flutter/material.dart';
import '/models/order_detail_model.dart';
import '../../../widgets/order_widget/order_card.dart';

class CompleteOrderWidget extends StatelessWidget {
  final List<OrderModel> completeOrders;

  const CompleteOrderWidget({
    this.completeOrders = const [],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completeOrders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = completeOrders[index];
        return OrderCard(
          idOrder: order.idOrder,
          date: order.date,
          quantity: order.quantity,
          total: order.totalPrice,
          status: order.statusOrder,
        );
      },
    );
  }
}
