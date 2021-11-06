import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_text.dart';

import '/constants/constants.dart';
import '/constants/dimen.dart';

import '/providers/shipping_address_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';
import '/widgets/loading_page.dart';
import '/widgets/shipping_address/shipping_address_item.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() =>
      new _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen>
    with AutomaticKeepAliveClientMixin<ShippingAddressScreen> {
  @override
  bool get wantKeepAlive => true;

  late Future _addressesFuture;
  @override
  void initState() {
    super.initState();
    _addressesFuture =
        Provider.of<ShippingAddressProvider>(context, listen: false)
            .fetchAllAddresses();
    print('??');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
