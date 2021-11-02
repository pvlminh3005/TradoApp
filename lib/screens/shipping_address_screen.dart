import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/components/primary_button.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/providers/shipping_address_provider.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';
import 'package:trado_app_uit/widgets/checkout_widget/address_detail_widget.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';
import 'package:trado_app_uit/widgets/shipping_address/shipping_address_item.dart';

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
    return Consumer<ShippingAddressProvider>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(AppDimen.spacing_2),
          child: provider.listAddresses.isEmpty
              ? LoadingPage()
              : ListView.builder(
                  itemCount: provider.listAddresses.length,
                  itemBuilder: (BuildContext context, int index) {
                    var address = provider.listAddresses[index];
                    return ShippingAddressItem(
                      shippingAddress: address,
                    );
                  },
                ),
        );
      },
    );
  }
}
