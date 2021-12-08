import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/components/custom_icon.dart';
import '/models/category_model.dart';
import '/routes/routes_manage.dart';
import '/components/config_price.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';

import 'sale_order_item.dart';

class CategoryOrderItem extends StatelessWidget {
  final CategoryModel? category;
  final Color colorBorder;
  final bool showQuantity;
  final bool showMore;

  const CategoryOrderItem({
    this.category,
    this.colorBorder = kTextColorGrey,
    this.showQuantity = true,
    this.showMore = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        RouteManage.category_detail,
        arguments: category!.id,
      ),
      child: Container(
        margin:
            const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_5),
        decoration: BoxDecoration(
          color: kBackgroundColorWhite,
          borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
        ),
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
                          showQuantity
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
      ),
    );
  }
}
