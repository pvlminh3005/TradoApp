import 'package:flutter/material.dart';
import 'package:trado_app_uit/widgets/sale_order_widget/widget/sale_order_item.dart';

class WaitingSaleOrderWidget extends StatelessWidget {
  const WaitingSaleOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return SaleOrderItem();
      },
    );
  }
}
