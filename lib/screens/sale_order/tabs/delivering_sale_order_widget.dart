import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/sale_order_item.dart';
import '/models/order_detail_model.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/providers/sale_order_provider.dart';

class DeliveringSaleOrderWidget extends StatelessWidget {
  const DeliveringSaleOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SaleOrderProvider>(
      builder: (context, provider, _) {
        var data = provider.fetchDeliveringSaleOrders();
        if (data.length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_box.png',
                ),
                CustomText(
                  'Chưa có đơn hàng nào chờ vận chuyển!',
                  fontSize: FontSize.BIG,
                  margin: const EdgeInsets.only(top: AppDimen.spacing_2),
                )
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return SaleOrderItem(
                orders: data[index],
                typeOrder: OrderDetailType.DELIVERING,
              );
            },
          );
        }
      },
    );
  }
}
