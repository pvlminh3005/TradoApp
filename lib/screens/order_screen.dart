import 'package:flutter/material.dart';
import '/components/custom_text.dart';

import '/widgets/order_widget/pay_order.dart';
import '/widgets/order_widget/all_order.dart';
import '/widgets/order_widget/cancel_order.dart';
import '/widgets/order_widget/complete_order.dart';
import '/widgets/order_widget/ship_order.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '/widgets/appbar_widget.dart';

List<Widget> _listWidgets = [
  AllOrderWidget(),
  PayOrderWidget(),
  ShipOrderWidget(),
  CompleteOrderWidget(),
  CancelOrderWidget(),
];

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _listWidgets.length,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Đơn hàng của tôi',
          bottom: _buildTabBar(),
          background: kBackgroundColorWhite,
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildTabBar() {
    return PreferredSize(
      preferredSize: Size(1000, 25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TabBar(
          indicatorColor: kPrimaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          tabs: [
            _buildTabText('Tất cả'),
            _buildTabText('Đang xử lý'),
            _buildTabText('Đang giao'),
            _buildTabText('Đã giao'),
            _buildTabText('Đã huỷ'),
          ],
        ),
      ),
    );
  }

  _buildTabText(String? title) {
    return CustomText(title!);
  }

  _buildBody() {
    return TabBarView(children: _listWidgets);
  }
}
