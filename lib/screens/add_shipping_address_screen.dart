import 'package:flutter/material.dart';
import 'package:trado_app_uit/widgets/appbar_widget.dart';

class AddShippingAddressScreen extends StatelessWidget {
  const AddShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      title: 'Thêm địa chỉ giao hàng',
    );
  }

  Widget _buildBody() {
    return Column(
      children: [],
    );
  }
}
