import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/components/primary_button.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';
import 'package:trado_app_uit/widgets/checkout_widget/shipping_address_widget.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBarWidget _buildAppBar(context) {
    return AppBarWidget(
      title: 'Địa chỉ giao hàng',
      childAction: [
        IconButton(
          icon: Icon(CupertinoIcons.add, color: kTextDark),
          onPressed: () {
            Navigator.pushNamed(context, RouteManage.add_shipping_address);
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.spacing_2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDetailAddress(),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildDetailAddress() {
    return Column(
      children: [
        _buildTitle(),
        _buildInfo(),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Image.asset('assets/images/icon_checked.png'),
        const SizedBox(width: 6.0),
        CustomText(
          'Đặt làm địa chỉ mặc định',
          fontSize: FontSize.MEDIUM - 1,
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return ShippingAddressWidget();
  }

  Widget _buildButton() {
    return PrimaryButton(
      title: 'Lưu địa chỉ',
      onPressed: () {},
    );
  }
}
