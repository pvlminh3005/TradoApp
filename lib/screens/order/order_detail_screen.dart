import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/loading/loading_app.dart';
import '/models/category_model.dart';
import '/services/order_api.dart';
import '/components/card_shadow.dart';
import '/components/config_price.dart';
import '/widgets/category_order_item.dart';
import '/components/primary_button.dart';
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
  final int processing;
  final String? idOrder;

  const OrderDetailScreen({
    this.processing = 0,
    this.idOrder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Chi tiết đơn đặt hàng',
        showCart: true,
      ),
      body: FutureBuilder<dynamic>(
        future: OrderApi.fetchOrderDetailById(idOrder!),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            LoadingApp.LOADWAITING();
            return SizedBox();
          } else {
            LoadingApp.DISMISS();

            if (snapshot.hasError) {
              return Center(child: CustomText('Có lỗi xảy ra'));
            }
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
                    TimeLineWidget(processing: processing),
                    _buildHeader(
                      icon: Icons.location_on_outlined,
                      title: 'Địa chỉ giao hàng',
                    ),
                    _buildShippingAddress(context),
                    _buildListCategories(snapshot.data!.categories),
                    _buildTotalPrice(),
                    _buildHeader(
                      icon: Icons.payments_outlined,
                      title: 'Phương thức thanh toán',
                    ),
                    _buildPaymentMethod(),
                    _buildOrderTime(),
                    _buildButton(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return PaymentMethodWidget();
  }

  Widget _buildHeader({IconData? icon, String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1 - 2),
      child: Row(
        children: [
          CustomIcon(
            icon,
            size: AppDimen.icon_size_big,
            color: kTextDark.withOpacity(.5),
          ),
          const SizedBox(width: 6.0),
          CustomText(
            title!,
            fontSize: FontSize.MEDIUM,
            color: kTextDark.withOpacity(.5),
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget _buildShippingAddress(BuildContext context) {
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

  Widget _buildListCategories(List<CategoryModel> categories) {
    return Container(
      padding: const EdgeInsets.only(
        top: AppDimen.verticalSpacing_5,
        bottom: AppDimen.verticalSpacing_10,
      ),
      constraints: BoxConstraints(
        maxHeight: 350,
      ),
      child: Column(
        children: categories.map((category) {
          return CategoryOrderItem(category: category);
        }).toList(),
      ),
    );
  }

  Widget _buildTotalPrice() {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kColorItemGrey,
          ),
        ),
      ),
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

  Widget _buildOrderTime() {
    return CardShadow(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimen.spacing_1 + 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: CustomText(
                    'Mã đơn hàng',
                    fontWeight: FontWeight.w700,
                    fontSize: FontSize.MEDIUM + 1,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: CustomText(
                    '#123456789',
                    fontWeight: FontWeight.w700,
                    fontSize: FontSize.MEDIUM + 1,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          _buildTitleOrderTime(
            title: 'Thời gian đặt hàng',
            date: '27/10/2021 14:50',
          ),
          _buildTitleOrderTime(
            title: 'Thời gian thanh toán',
            date: '27/10/2021 14:50',
          ),
          _buildTitleOrderTime(
            title: 'Thời gian giao hàng cho vận chuyển',
            date: '27/10/2021 14:50',
          ),
          _buildTitleOrderTime(
            title: 'Thời gian hoàn thành',
            date: '27/10/2021 14:50',
          ),
        ],
      ),
    );
  }

  Widget _buildTitleOrderTime({String? title, String? date}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: CustomText(
              title!,
              maxLines: 2,
              color: kTextColorGrey,
            ),
          ),
          Flexible(
            flex: 1,
            child: CustomText(
              date!,
              maxLines: 1,
              color: kTextColorGrey,
            ),
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
