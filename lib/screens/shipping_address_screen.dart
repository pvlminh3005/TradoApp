import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_text.dart';

import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';

import 'package:trado_app_uit/providers/shipping_address_provider.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';
import 'package:trado_app_uit/widgets/shipping_address/shipping_address_item.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  late Future _addressesFuture;
  @override
  void initState() {
    _addressesFuture =
        Provider.of<ShippingAddressProvider>(context, listen: false)
            .fetchAllAddresses();
    print('Call');
    super.initState();
  }

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
    return FutureBuilder(
      future: _addressesFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          if (snapshot.hasError) {
            return Center(
              child: CustomText('Có lỗi xảy ra!'),
            );
          } else {
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
      },
    );
  }
}
