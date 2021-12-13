import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_search_bar.dart';
import 'package:trado_app_uit/models/category_model.dart';
import '/extensions/custom_extension.dart';
import '/components/custom_refresh_page.dart';
import '/components/custom_icon.dart';
import '/constants/constants.dart';
import '/providers/category_provider.dart';
import '/widgets/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    fetchData();

    if (mounted) return;
  }

  Future<void> fetchData() async {
    await Provider.of<CategoryProvider>(context, listen: false)
        .fetchAllCategories();
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(
          icon: CustomIcon(
            CupertinoIcons.search,
            color: kPrimaryColor,
          ),
          onPressed: () {
            showSearch(
                context: context,
                delegate: CustomSearch(
                  data: Provider.of<CategoryProvider>(context, listen: false)
                      .listCategories,
                ));
          },
        ),
        showCart: true,
      ),
      body: CustomRefreshPage(
        onRefresh: fetchData,
        child: Consumer<CategoryProvider>(builder: (ctx, provider, _) {
          return SizedBox().gridCategory(provider.listCategories);
        }),
      ),
    );
  }
}
