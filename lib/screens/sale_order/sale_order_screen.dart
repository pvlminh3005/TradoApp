import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/routes/routes_manage.dart';
import '/components/custom_icon.dart';
import '/constants/dimen.dart';
import '/providers/sale_order_provider.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/widgets/appbar_widget.dart';
import 'tabs/waiting_sale_order_widget.dart';
import 'tabs/delivering_sale_order_widget.dart';
import 'tabs/success_sale_order_widget.dart';

List<Widget> _listWidgets = [
  // AllSaleOrderWidget(),
  WaitingSaleOrderWidget(),
  DeliveringSaleOrderWidget(),
  SuccessSaleOrderWidget(),
];

class SaleOrderScreen extends StatefulWidget {
  const SaleOrderScreen({Key? key}) : super(key: key);

  @override
  State<SaleOrderScreen> createState() => _SaleOrderScreenState();
}

class _SaleOrderScreenState extends State<SaleOrderScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<SaleOrderProvider>(context, listen: false).fetchAllSaleOrders();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _listWidgets.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(AppDimen.horizontalSpacing_10),
          child: TabBarView(children: _listWidgets),
        ),
      ),
    );
  }

  AppBarWidget _buildAppBar(BuildContext context) {
    return AppBarWidget(
      title: 'Đơn bán',
      background: kBackgroundColorWhite,
      color: kPrimaryColor,
      showCart: true,
      childAction: [
        CustomIcon(
          CupertinoIcons.chart_bar_square,
          color: kPrimaryColor,
          onTap: () => Navigator.pushNamed(context, RouteManage.sale_chart),
        ),
      ],
      bottom: _buildTabBar(),
    );
  }

  _buildTabBar() {
    return PreferredSize(
      preferredSize: Size(1000, 25),
      child: TabBar(
        indicatorColor: kPrimaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        tabs: [
          // _buildTabText('Tất cả'),
          _buildTabText('Chờ xác nhận'),
          _buildTabText('Đang vận chuyển'),
          _buildTabText('Đã giao hàng'),
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
