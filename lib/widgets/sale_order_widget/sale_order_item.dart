import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/card_shadow.dart';
import 'package:trado_app_uit/components/config_price.dart';
import 'package:trado_app_uit/components/custom_button.dart';
import 'package:trado_app_uit/components/custom_icon.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';

class SaleOrderItem extends StatelessWidget {
  const SaleOrderItem({Key? key}) : super(key: key);
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
          _buildDivider(),
          _buildDetailOrder(),
          _buildDivider(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CustomIcon(
          icon: CupertinoIcons.profile_circled,
          color: kPrimaryColor,
          margin: const EdgeInsets.only(right: AppDimen.horizontalSpacing_5),
        ),
        TextSaleOrder(
          'Lê Minh',
          fontWeight: FontWeight.w700,
          color: kTextDark,
        ),
        const Spacer(),
        TextSaleOrder(
          'Chờ xác nhận',
          fontWeight: FontWeight.w700,
          color: kHighlightColor,
        ),
      ],
    );
  }

  Widget _buildInfoCategory() {
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
                  TextSaleOrder('${FormatPrice(price)} đ'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPrice() {
    return Row(
      children: [
        CustomIcon(
          icon: Icons.payments_outlined,
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
          '${FormatPrice(price + 10300)} đ',
          fontWeight: FontWeight.w700,
          fontSize: FontSize.MEDIUM + 1,
          color: kPrimaryColor,
        ),
      ],
    );
  }

  Widget _buildDetailOrder() {
    return ExpansionTile(
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
        TextSaleOrder('LeMinh'),
        TextSaleOrder('(+84) 0911222333'),
        TextSaleOrder('Nha xx, Duong xx, Quan XX, Tp XX, Tinh XX'),
        Row(
          children: [
            CustomText(
              'Ghi chú: ',
              fontSize: FontSize.SMALL + 1,
              fontWeight: FontWeight.bold,
              color: kErrorColor.withOpacity(.7),
            ),
            TextSaleOrder('Duong vao tim em sao oi bang gia'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: TextSaleOrder(
            'Mã đơn hàng: #123456789',
            fontSize: FontSize.SMALL,
          ),
        ),
        CustomButton(
          'Xác nhận đơn hàng',
          radius: 0,
          sizeStyle: CustomBottomSizeStyle.WRAP_CONTENT,
          padding: const EdgeInsets.all(AppDimen.spacing_2 - 3),
          fontSize: FontSize.MEDIUM,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_10),
      child: Divider(
        thickness: 1,
        height: 0,
      ),
    );
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
