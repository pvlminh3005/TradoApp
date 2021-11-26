import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/order_provider.dart';
import 'widgets/order_card.dart';

class CompleteOrderWidget extends StatelessWidget {
  const CompleteOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _listDeliveredOrders =
        Provider.of<OrderProvider>(context, listen: false).deliveredOrders();

    return ListView.builder(
      itemCount: _listDeliveredOrders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = _listDeliveredOrders[index];
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
