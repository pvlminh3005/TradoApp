import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/config_price.dart';
import 'package:trado_app_uit/widgets/category_order_item.dart';
import 'package:trado_app_uit/widgets/sale_order_widget/widget/sale_order_item.dart';
import '/providers/cart_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/bage.dart';
import '/components/primary_button.dart';
import '/models/shipping_address_model.dart';
import '/providers/shipping_address_provider.dart';
import '/widgets/checkout_widget/address_detail_widget.dart';
import '/components/custom_icon.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/widgets/appbar_widget.dart';
import '/widgets/payment_method_widget.dart';
import '/widgets/time_line_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  final int? processing;

  const OrderDetailScreen({
    this.processing = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Chi tiết đơn đặt hàng',
        childAction: [
          Consumer<CartProvider>(
            builder: (ctx, cartData, ch) => Badge(
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.cart_fill,
                  size: 25,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManage.cart);
                },
              ),
              value: cartData.cartCount.toString(),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimen.horizontalSpacing_16,
        ),
        child: Column(
          children: [
            _buildHeader(
              icon: Icons.local_shipping_outlined,
              title: 'Trạng thái đơn hàng',
            ),
            TimeLineWidget(),
            _buildHeader(
              icon: Icons.location_on_outlined,
              title: 'Địa chỉ giao hàng',
            ),
            _buildShippingAddress(),
            _buildListCategories(),
            _buildTotalPrice(),
            _buildHeader(
              icon: Icons.payments_outlined,
              title: 'Phương thức thanh toán',
            ),
            _buildPaymentMethod(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return PaymentMethodWidget();
  }

  Widget _buildHeader({IconData? icon, String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: Row(
        children: [
          CustomIcon(
            icon: icon,
            size: AppDimen.icon_size_big,
            color: kTextDark.withOpacity(.5),
          ),
          const SizedBox(width: 6.0),
          CustomText(
            title!,
            fontSize: FontSize.MEDIUM + 1,
          ),
        ],
      ),
    );
  }

  Widget _buildShippingAddress() {
    return Consumer<ShippingAddressProvider>(
      builder: (ctx, provider, _) {
        ShippingAddressModel data = provider.getDefaultAddress();
        return AddressDetailWidget(
          name: data.name,
          phoneNumber: data.phoneNumber,
          address: data.address,
          note: data.note,
        );
      },
    );
  }

  Widget _buildListCategories() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 350,
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 2; i++) CategoryOrderItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTotalPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: Row(
        children: [
          CustomText(
            'Tổng thanh toán: ',
            fontSize: FontSize.BIG,
            fontWeight: FontWeight.w700,
          ),
          CustomText(
            '${FormatPrice(7000 + 10300)} đ',
            fontWeight: FontWeight.w700,
            fontSize: FontSize.MEDIUM + 1,
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return PrimaryButton(
      title: 'Liên hệ nhà bán hàng',
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_16),
      onPressed: () {},
    );
  }
}
