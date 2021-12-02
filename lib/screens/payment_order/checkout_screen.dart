import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/cart_provider.dart';
import '/providers/order_provider.dart';
import '/routes/routes_manage.dart';
import '/providers/shipping_address_provider.dart';
import '/components/card_shadow.dart';
import '/components/config_price.dart';
import '/components/primary_button.dart';
import '/constants/sizes.dart';
import '../../widgets/checkout_widget/address_detail_widget.dart';
import '/widgets/payment_method_widget.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/widgets/appbar_widget.dart';

// ignore: must_be_immutable
class CheckOutScreen extends StatelessWidget {
  final int totalPrice;
  final int quantity;

  CheckOutScreen({
    this.totalPrice = 0,
    this.quantity = 0,
    Key? key,
  }) : super(key: key);

  late int deliveryPrice = 20000;
  late int voucherPrice = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle('Địa chỉ giao hàng'),
                    _buildDetailShippingAddress(context),
                    _buildTitle('Payment'),
                    _buildDetailPaymentMethod(),
                    _buildInfoPrice(),
                    _buildTotalPrice(),
                    // __buildDetailPayment(),
                  ],
                ),
              ),
            ),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      title: 'Xác nhận đơn hàng',
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

  Widget _buildDetailShippingAddress(BuildContext context) {
    return Consumer<ShippingAddressProvider>(
      builder: (ctx, provider, _) {
        var data = provider.defaultAddress;
        return AddressDetailWidget(
          name: data.name,
          phoneNumber: data.phoneNumber,
          address: data.address,
          note: data.note,
        );
      },
    );
  }

  Widget _buildDetailPaymentMethod() {
    return PaymentMethodWidget();
  }

  Widget _buildInfoPrice() {
    return CardShadow(
      child: Column(children: [
        _buildDetailInfoPrice(title: 'Tiền hàng', price: totalPrice),
        _buildDetailInfoPrice(title: 'Vận chuyển', price: deliveryPrice),
        _buildDetailInfoPrice(
          title: 'Giảm giá',
          price: voucherPrice,
          colorPrice: kErrorColor,
        ),
      ]),
    );
  }

  Widget _buildTotalPrice() {
    return CardShadow(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: _buildDetailInfoPrice(
        title: 'Tổng cộng',
        price: (totalPrice + deliveryPrice - voucherPrice),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (ctx, provider, _) {
        return PrimaryButton(
          title: 'Đặt hàng',
          onPressed: () async {
            await provider.addToOrder(
              totalPrice: (totalPrice + deliveryPrice - voucherPrice),
              quantity: quantity,
            );
            Provider.of<CartProvider>(context, listen: false)
                .removeCategoriesInCartWhenCheckOut();
            Navigator.pushNamed(context, RouteManage.success);
          },
        );
      },
    );
  }

  Widget _buildDetailInfoPrice({
    String? title,
    int? price,
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
