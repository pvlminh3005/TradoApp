import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/providers/order_provider.dart';

import 'widgets/order_card.dart';

class AllOrderWidget extends StatelessWidget {
  const AllOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderProvider providerOrder =
        Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      body: _buildBody(providerOrder),
    );
  }

  Widget _buildBody(OrderProvider provider) {
    return ListView.builder(
      itemCount: provider.listOrders.length,
      itemBuilder: (BuildContext context, int index) {
        var order = provider.listOrders[index];
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
