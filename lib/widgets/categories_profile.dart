import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_refresh_page.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/extensions/custom_extension.dart';

import '/constants/constants.dart';
import '/providers/category_provider.dart';
import '../models/category_model.dart';
import './category_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomRefreshPage(
        onRefresh: () async {},
        child: Consumer<CategoryProvider>(builder: (ctx, provider, _) {
          return SizedBox().gridCategory(provider.listCategories);
        }),
      ),
      // body: Container(
      //   height: 300,
      //   child: CategoryItem(
      //     category: listCategories[1],
      //   ),
      // ),
    );
  }
}
