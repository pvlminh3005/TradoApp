import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '/components/config_price.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';

import 'sale_order_widget/widget/sale_order_item.dart';

class CategoryOrderItem extends StatelessWidget {
  const CategoryOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: DottedBorder(
        color: kTextColorGrey,
        borderType: BorderType.RRect,
        radius: Radius.circular(AppDimen.radiusNormal),
        padding: const EdgeInsets.all(AppDimen.spacing_1 - 3),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              margin: const EdgeInsets.only(right: AppDimen.spacing_1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FtZXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSaleOrder('Sony-Canon', fontWeight: FontWeight.w700),
                  TextSaleOrder('Số lượng: 1'),
                  TextSaleOrder('${FormatPrice(123123123)} đ'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
