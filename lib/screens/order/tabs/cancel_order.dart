import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/order_provider.dart';
import '../../../widgets/order_widget/order_card.dart';

class CancelOrderWidget extends StatelessWidget {
  const CancelOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (ctx, provider, _) {
        var data = provider.cancelledOrders();
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            var order = data[index];
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
    );
  }
}
