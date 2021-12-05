import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/sale_order_provider.dart';
import '../models/order_detail_model.dart';
import '/widgets/category_order_item.dart';
import '/components/card_shadow.dart';
import '/components/config_price.dart';
import '/components/custom_button.dart';
import '/components/custom_icon.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';

class SaleOrderItem extends StatelessWidget {
  final OrderDetailModel orders;
  final OrderDetailType typeOrder;

  const SaleOrderItem({
    required this.orders,
    this.typeOrder = OrderDetailType.WAITING,
    Key? key,
  }) : super(key: key);
  final double price = 250000;

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      padding: const EdgeInsets.all(AppDimen.spacing_2 - 4),
      margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildInfoCategory(),
          _buildTotalPrice(),
          _buildDetailOrder(context),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CustomIcon(
          CupertinoIcons.profile_circled,
          color: kPrimaryColor,
          margin: const EdgeInsets.only(right: AppDimen.horizontalSpacing_5),
        ),
        TextSaleOrder(
          orders.name,
          fontWeight: FontWeight.w700,
          color: kTextDark,
        ),
        const Spacer(),
        _buildTextStatus(),
      ],
    );
  }

  Widget _buildTextStatus() {
    switch (typeOrder) {
      case OrderDetailType.DELIVERING:
        return TextSaleOrder(
          'Đang vận chuyển',
          fontWeight: FontWeight.w700,
          color: kColorGreen,
        );
      case OrderDetailType.SUCCESS:
        return TextSaleOrder(
          'Đã vận chuyển',
          fontWeight: FontWeight.w700,
          color: kTextColorGrey,
        );
      default:
        return TextSaleOrder(
          'Chờ xác nhận',
          fontWeight: FontWeight.w700,
          color: kHighlightColor,
        );
    }
  }

  Widget _buildInfoCategory() {
    return Container(
      constraints: BoxConstraints(maxHeight: 500),
      child: SingleChildScrollView(
        child: Column(
          children: orders.categories.map((order) {
            return CategoryOrderItem(category: order);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTotalPrice() {
    return Row(
      children: [
        CustomIcon(
          Icons.payments_outlined,
          color: kHighlightColor,
          size: AppDimen.icon_size_big - 2,
          margin: const EdgeInsets.symmetric(
              horizontal: AppDimen.horizontalSpacing_5),
        ),
        TextSaleOrder(
          'Tổng thanh toán: ',
          fontSize: FontSize.MEDIUM + 1,
        ),
        TextSaleOrder(
          '${FormatPrice(orders.totalPrice)} đ',
          fontWeight: FontWeight.w700,
          fontSize: FontSize.MEDIUM + 1,
          color: kPrimaryColor,
        ),
      ],
    );
  }

  Widget _buildDetailOrder(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_10),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(0.0),
          childrenPadding: const EdgeInsets.all(0.0),
          title: TextSaleOrder(
            'Chi tiết đơn hàng',
            fontWeight: FontWeight.w700,
            margin: const EdgeInsets.all(0.0),
          ),
          expandedAlignment: Alignment.topLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 5.0),
            TextSaleOrder(orders.address.name),
            TextSaleOrder(orders.address.phoneNumber),
            TextSaleOrder(orders.address.address),
            Row(
              children: [
                CustomText(
                  'Ghi chú: ',
                  fontSize: FontSize.SMALL + 1,
                  fontWeight: FontWeight.bold,
                  color: kErrorColor.withOpacity(.7),
                ),
                TextSaleOrder(orders.address.note),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: TextSaleOrder(
            'Mã đơn hàng: #${orders.id}',
            fontSize: FontSize.SMALL,
          ),
        ),
        _buildButton(),
      ],
    );
  }

  Widget _buildButton() {
    switch (typeOrder) {
      case OrderDetailType.WAITING:
        return Consumer<SaleOrderProvider>(
          builder: (context, provider, _) => CustomButton(
            'Xác nhận đơn hàng',
            radius: 0,
            sizeStyle: CustomBottomSizeStyle.WRAP_CONTENT,
            padding: const EdgeInsets.all(AppDimen.spacing_2 - 3),
            fontSize: FontSize.MEDIUM,
            fontWeight: FontWeight.w500,
            backgroundColor: kPrimaryColor,
            onTap: () async {
              await provider.changeStatusOrder(
                orders.id,
                type: OrderDetailType.DELIVERING,
              );
            },
          ),
        );
      case OrderDetailType.DELIVERING:
        return Consumer<SaleOrderProvider>(
          builder: (context, provider, _) => CustomButton(
            'Đang vận chuyển',
            radius: 0,
            sizeStyle: CustomBottomSizeStyle.WRAP_CONTENT,
            padding: const EdgeInsets.all(AppDimen.spacing_2 - 3),
            fontSize: FontSize.MEDIUM,
            fontWeight: FontWeight.w500,
            backgroundColor: kColorGreen,
            onTap: () async {
              await provider.changeStatusOrder(
                orders.id,
                type: OrderDetailType.SUCCESS,
              );
            },
          ),
        );
      default:
        return CustomButton(
          'Đã vận chuyển',
          radius: 0,
          sizeStyle: CustomBottomSizeStyle.WRAP_CONTENT,
          padding: const EdgeInsets.all(AppDimen.spacing_2 - 3),
          fontSize: FontSize.MEDIUM,
          fontWeight: FontWeight.w500,
          backgroundColor: kTextColorGrey,
          onTap: () {},
        );
    }
  }
}

class TextSaleOrder extends StatelessWidget {
  final String? title;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final int maxLines;
  final EdgeInsets margin;

  const TextSaleOrder(
    this.title, {
    this.fontWeight = FontWeight.w500,
    this.color = Colors.black54,
    this.fontSize = FontSize.MEDIUM,
    this.maxLines = 2,
    this.margin =
        const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_5),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title!,
      margin: margin,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      maxLines: maxLines,
    );
  }
}
