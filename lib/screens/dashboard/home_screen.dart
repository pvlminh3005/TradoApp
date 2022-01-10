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

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _scrollCtrl;
  late CategoryProvider provider;
  @override
  void initState() {
    provider = Provider.of<CategoryProvider>(context, listen: false);
    _scrollCtrl = ScrollController();
    _scrollCtrl.addListener(() async {
      if (_scrollCtrl.position.pixels >= _scrollCtrl.position.maxScrollExtent &&
          provider.isLoading == false) {
        await provider.fetchLoadMoreCategories();
        // print('FETCH');
      }
    });
    super.initState();
  }

  Future<void> fetchData() async {
    await Provider.of<CategoryProvider>(context, listen: false)
        .fetchAllCategories();
    ;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
              ),
            );
          },
        ),
        showCart: true,
      ),
      body: Consumer<CategoryProvider>(builder: (ctx, provider, _) {
        return CustomRefreshPage(
          onRefresh: () async {
            await fetchData();
          },
          child: SizedBox().gridCategory(
            provider.listCategories,
            scrollCtrl: _scrollCtrl,
          ),
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
