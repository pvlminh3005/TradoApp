import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trado_app_uit/components/card_shadow.dart';
import 'package:trado_app_uit/components/config_price.dart';
import 'package:trado_app_uit/components/primary_button.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/widgets/checkout_widget/shipping_address_widget.dart';
import 'package:trado_app_uit/widgets/payment_method_widget.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/widgets/appbar_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      title: 'Xác nhận đơn hàng',
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        left: AppDimen.horizontalSpacing_16,
        right: AppDimen.horizontalSpacing_16,
        bottom: AppDimen.spacing_2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailList(),
          _buildFooterInfo(),
        ],
      ),
    );
  }

  Widget _buildDetailList() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Địa chỉ giao hàng'),
            _buildDetailShippingAddress(),
            _buildTitle('Payment'),
            _buildDetailPaymentMethod(),
            // __buildDetailPayment(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String? title) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimen.spacing_1),
      child: CustomText(
        title!,
        color: kTextColorGrey,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildDetailShippingAddress() {
    return ShippingAddressWidget();
  }

  Widget _buildDetailPaymentMethod() {
    return PaymentMethodWidget();
  }

  Widget _buildFooterInfo() {
    return Column(
      children: [
        _buildInfoPrice(),
        _buildTotalPrice(),
        _buildButton(),
      ],
    );
  }

  Widget _buildInfoPrice() {
    return CardShadow(
      child: Column(children: [
        _buildDetailInfoPrice(title: 'Tiền hàng', price: 100000),
        _buildDetailInfoPrice(title: 'Vận chuyển', price: 20000),
        _buildDetailInfoPrice(
          title: 'Giảm giá',
          price: 0,
          colorPrice: kErrorColor,
        ),
      ]),
    );
  }

  Widget _buildTotalPrice() {
    return CardShadow(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: _buildDetailInfoPrice(title: 'Tổng cộng', price: 120000),
    );
  }

  Widget _buildButton() {
    return PrimaryButton(
      title: 'Đặt hàng',
      onPressed: () {},
    );
  }

  Widget _buildDetailInfoPrice({
    String? title,
    double? price,
    Color? colorPrice = kTextDark,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            '${title!}:',
            color: kTextColorGrey,
            fontSize: FontSize.BIG,
          ),
          CustomText(
            '${FormatPrice(price!)} đ',
            fontWeight: FontWeight.w700,
            fontSize: FontSize.BIG,
            color: colorPrice!,
          ),
        ],
      ),
    );
  }
}
