import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_text.dart';

import '/constants/constants.dart';
import '/constants/dimen.dart';

import '/providers/shipping_address_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';
import '/widgets/shipping_address/shipping_address_item.dart';

class ShippingAddressScreen extends StatelessWidget {
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
          icon: Icon(CupertinoIcons.add, color: kPrimaryColor),
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
              ? Center(
                  child: CustomText('Bạn chưa nhập địa chỉ nào!'),
                )
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
