import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants/dimen.dart';
import '/providers/order_provider.dart';
import '/widgets/dotted_widget.dart';
import '/components/custom_text.dart';

import '/constants/constants.dart';
import '/widgets/appbar_widget.dart';
import 'tabs/all_order.dart';
import 'tabs/cancel_order.dart';
import 'tabs/complete_order.dart';
import 'tabs/in_processing_order.dart';
import 'tabs/ship_order.dart';
import 'tabs/waiting_review_order.dart';

List<Widget> _listWidgets = [
  AllOrderWidget(),
  InprocessingOrderWidget(),
  ShipOrderWidget(),
  CompleteOrderWidget(),
  CancelOrderWidget(),
  WaitingReviewOrder(),
];

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Provider.of<OrderProvider>(context, listen: false).fetchAllMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderProvider>(context, listen: false);
    return DefaultTabController(
      length: 6,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBarWidget(
          background: kBackgroundColorWhite,
          title: 'Đơn hàng của tôi',
          bottom: PreferredSize(
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
                  _buildTabText(
                    'Chờ đánh giá',
                    checkDotted:
                        provider.deliveredOrders().length != 0 ? true : false,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _listWidgets,
        ),
      ),
    );
  }

  _buildTabText(String? title, {bool checkDotted = false}) {
    if (checkDotted) {
      return DottedWidget(
        child: CustomText(
          title!,
          padding: EdgeInsets.only(
            right: AppDimen.spacing_1,
            bottom: 5.0,
          ),
        ),
      );
    } else {
      return CustomText(
        title!,
        padding: EdgeInsets.only(
          right: AppDimen.spacing_1,
          bottom: 5.0,
        ),
      );
    }
  }
}
