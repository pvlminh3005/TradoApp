import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_icon.dart';
import 'package:trado_app_uit/models/category_model.dart';
import '/components/config_price.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';

import 'sale_order_widget/widget/sale_order_item.dart';

class CategoryOrderItem extends StatelessWidget {
  final CategoryModel? cagetogry;
  final Color colorBorder;
  final bool showMore;

  const CategoryOrderItem({
    this.cagetogry,
    this.colorBorder = kTextColorGrey,
    this.showMore = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_5),
      child: DottedBorder(
        color: colorBorder,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSaleOrder('Sony-Canon', fontWeight: FontWeight.w700),
                      !showMore
                          ? TextSaleOrder('Số lượng: 1')
                          : const SizedBox(height: AppDimen.spacing_1 + 2),
                      TextSaleOrder('${FormatPrice(123123123)} đ'),
                    ],
                  ),
                  showMore
                      ? CustomIcon(
                          CupertinoIcons.ellipsis_vertical,
                          size: AppDimen.icon_size_small,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
