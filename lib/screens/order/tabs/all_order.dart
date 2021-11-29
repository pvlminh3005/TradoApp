import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/order_widget/order_card.dart';
import '/providers/order_provider.dart';

class AllOrderWidget extends StatelessWidget {
  const AllOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OrderProvider>(
        builder: (ctx, provider, _) {
          return ListView.builder(
            itemCount: provider.listOrders.length,
            itemBuilder: (BuildContext context, int index) {
              var order = provider.listOrders[index];
              return OrderCard(
                idOrder: order.idOrder,
                date: order.date,
                quantity: order.quantity,
                total: order.totalPrice,
                status: order.statusOrder,
              );
            },
          );
        },
      ),
    );
  }
}
