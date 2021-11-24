import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/providers/sale_order_provider.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/providers/cart_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';
import '/widgets/bage.dart';
import '/widgets/sale_order_widget/all_sale_order_widget.dart';
import '/widgets/sale_order_widget/delivering_sale_order_widget.dart';
import '/widgets/sale_order_widget/waiting_sale_order_widget.dart';

List<Widget> _listWidgets = [
  // AllSaleOrderWidget(),
  WaitingSaleOrderWidget(),
  DeliveringSaleOrderWidget(),
];

class SaleOrderScreen extends StatefulWidget {
  const SaleOrderScreen({Key? key}) : super(key: key);

  @override
  State<SaleOrderScreen> createState() => _SaleOrderScreenState();
}

class _SaleOrderScreenState extends State<SaleOrderScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<SaleOrderProvider>(context, listen: false).fetchAllSaleOrders();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _listWidgets.length,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  AppBarWidget _buildAppBar(BuildContext context) {
    return AppBarWidget(
      title: 'Đơn bán',
      background: kBackgroundColorWhite,
      color: kPrimaryColor,
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
      bottom: _buildTabBar(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.horizontalSpacing_10),
      child: TabBarView(children: _listWidgets),
    );
  }

  _buildTabBar() {
    return PreferredSize(
      preferredSize: Size(0, 25),
      child: TabBar(
        indicatorColor: kPrimaryColor,
        tabs: [
          // _buildTabText('Tất cả'),
          _buildTabText('Chờ xác nhận'),
          _buildTabText('Đang vận chuyển'),
        ],
      ),
    );
  }

  _buildTabText(String? title) {
    return CustomText(
      title!,
      padding: EdgeInsets.only(bottom: 5.0),
    );
  }
}
