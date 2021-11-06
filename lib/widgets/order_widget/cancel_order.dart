import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/order_provider.dart';
import 'widgets/order_card.dart';

class CancelOrderWidget extends StatelessWidget {
  const CancelOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listCancelledOrders =
        Provider.of<OrderProvider>(context, listen: false).cancelledOrders();
    return Scaffold(
      body: _buildBody(listCancelledOrders),
    );
  }

  Widget _buildBody(List listCancelledOrders) {
    return ListView.builder(
      itemCount: listCancelledOrders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = listCancelledOrders[index];
        return OrderCard(
          idOrder: order['idOrder'],
          date: order['date'],
          quantity: order['quantity'],
          total: order['total'],
          status: order['status'],
        );
      },
    );
  }
}
