import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/order_provider.dart';

import 'widgets/order_card.dart';

class InprocessingOrderWidget extends StatelessWidget {
  const InprocessingOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _listInprocessingOrders =
        Provider.of<OrderProvider>(context, listen: false).inProcessingOrders();

    return ListView.builder(
      itemCount: _listInprocessingOrders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = _listInprocessingOrders[index];
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
