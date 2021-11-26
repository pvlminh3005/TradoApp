import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/order_provider.dart';
import 'widgets/order_card.dart';

class ShipOrderWidget extends StatelessWidget {
  const ShipOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _listDeliveringOrders =
        Provider.of<OrderProvider>(context, listen: false).deliveringOrders();

    return ListView.builder(
      itemCount: _listDeliveringOrders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = _listDeliveringOrders[index];
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
