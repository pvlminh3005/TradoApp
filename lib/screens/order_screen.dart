import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/providers/order_provider.dart';
import '/components/custom_text.dart';

import '../widgets/order_widget/in_processing_order.dart';
import '/widgets/order_widget/all_order.dart';
import '/widgets/order_widget/cancel_order.dart';
import '/widgets/order_widget/complete_order.dart';
import '/widgets/order_widget/ship_order.dart';
import '/constants/constants.dart';
import '/widgets/appbar_widget.dart';

List<Widget> _listWidgets = [
  AllOrderWidget(),
  InprocessingOrderWidget(),
  ShipOrderWidget(),
  CompleteOrderWidget(),
  CancelOrderWidget(),
];

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<OrderProvider>(context, listen: false).fetchAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _listWidgets.length,
      initialIndex: 1,
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
          unselectedLabelColor: Colors.red,
          tabs: [
            _buildTabText('Tất cả'),
            _buildTabText('Đang xử lý'),
            _buildTabText('Đang vận chuyển'),
            _buildTabText('Đã giao'),
            _buildTabText('Đã huỷ'),
          ],
        ),
      ),
    );
  }

  _buildTabText(String? title) {
    return CustomText(
      title!,
      padding: EdgeInsets.only(bottom: 5.0),
    );
  }

  _buildBody() {
    return TabBarView(children: _listWidgets);
  }
}
