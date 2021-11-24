import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/models/order_model.dart';
import '/components/custom_text.dart';
import '/providers/sale_order_provider.dart';
import '/widgets/sale_order_widget/widget/sale_order_item.dart';

class WaitingSaleOrderWidget extends StatelessWidget {
  const WaitingSaleOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SaleOrderProvider>(
      builder: (context, provider, _) {
        var data = provider.fetchWaitingSaleOrders();
        if (data.length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_box.png',
                ),
                CustomText(
                  'Chưa có đơn hàng nào chờ bạn xác nhận!',
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
              return SaleOrderItem(orders: data[index]);
            },
          );
        }
      },
    );
  }
}
