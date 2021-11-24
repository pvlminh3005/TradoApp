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
  final CategoryModel? category;
  final Color colorBorder;
  final bool showMore;

  const CategoryOrderItem({
    this.category,
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
                  image: NetworkImage(category!.imageUrl[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextSaleOrder(
                          category!.title,
                          fontWeight: FontWeight.w700,
                          maxLines: 1,
                        ),
                        !showMore
                            ? TextSaleOrder('Số lượng: ${category!.quantity}')
                            : const SizedBox(height: AppDimen.spacing_1 + 2),
                        TextSaleOrder('${FormatPrice(category!.price)} đ'),
                      ],
                    ),
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
