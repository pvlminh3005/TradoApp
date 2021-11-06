import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';

class ManageMyCategoryScreen extends StatelessWidget {
  const ManageMyCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBarWidget _buildAppBar(BuildContext context) {
    return AppBarWidget(
      title: 'Sản phẩm của tôi',
      background: kBackgroundColorWhite,
      childAction: [
        IconButton(
          icon: Icon(CupertinoIcons.add, color: kPrimaryColor),
          onPressed: () {
            Navigator.pushNamed(context, RouteManage.edit_my_category);
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column();
  }
}
