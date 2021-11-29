import 'package:flutter/material.dart';
import '/models/order_detail_model.dart';

class WaitingReviewOrder extends StatelessWidget {
  final List<OrderModel> waitingReviewOrders;

  const WaitingReviewOrder({
    this.waitingReviewOrders = const [],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: waitingReviewOrders.length,
        itemBuilder: (BuildContext context, int index) {
          var waitingOrder = waitingReviewOrders[index];
          return Text('Hi');
        },
      ),
    );
  }
}
