import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/auth_controller.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/providers/cart_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';
import '/widgets/bage.dart';
import '/widgets/header_info_profile.dart';
import '/widgets/primary_button.dart';
import '/widgets/profile_widget.dart/card_profile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBarWidget _buildAppBar(BuildContext context) {
    return AppBarWidget(
      background: kBackgroundColorWhite,
      color: kPrimaryColor,
      showLeading: false,
      childAction: Consumer<CartProvider>(
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
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppDimen.spacing_1),
      child: Column(
        children: [
          _buildHeaderInfo(),
          _buildCardProfile(),
          _buildButtonLogout(context),
        ],
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return HeaderInfoProfile(isMyProfile: true);
  }

  Widget _buildCardProfile() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppDimen.verticalSpacing_16,
          ),
          child: Column(
            children: [
              CardInfoProfileWidget(
                title: 'Quản lý sản phẩm',
                subtitle: '10 sản phẩm',
              ),
              CardInfoProfileWidget(
                title: 'Đơn hàng của tôi',
                subtitle: '0 đơn hàng sẵn có',
              ),
              CardInfoProfileWidget(
                title: 'Địa chỉ giao hàng',
                subtitle: '2 địa chỉ',
              ),
              CardInfoProfileWidget(title: 'Thông tin cá nhân'),
              CardInfoProfileWidget(title: 'Cài đặt'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonLogout(BuildContext context) {
    return PrimaryButton(
      title: 'Đăng xuất',
      margin: const EdgeInsets.all(AppDimen.horizontalSpacing_16),
      backgroundColor: kErrorColor,
      onPressed: () async {
        await AuthController().signOut();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteManage.splash, (route) => false);
      },
    );
  }
}
