import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_refresh_page.dart';
import '/components/loading/custom_form_search.dart';
import '/models/category_model.dart';
import '/extensions/custom_extension.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/providers/category_provider.dart';

import '/constants/constants.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';

class ManageMyCategoryScreen extends StatelessWidget {
  const ManageMyCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryProvider>(context, listen: false)
        .fetchAllCategoriesMyUser();
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomRefreshPage(
        onRefresh: () async {
          await Provider.of<CategoryProvider>(context, listen: false)
              .fetchAllCategoriesMyUser();
        },
        child: Column(
          children: [
            _buildSearch(Provider.of<CategoryProvider>(context, listen: false)
                .listCategories),
            _buildListCategories(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch(var dataSearch) {
    return CustomFormSearch(data: dataSearch);
  }

  Widget _buildListCategories() {
    return Expanded(
      child: Consumer<CategoryProvider>(builder: (ctx, provider, _) {
        if (provider.listMyCategories.length == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_box.png',
                ),
                CustomText(
                  'Bạn chưa có sản phẩm nào!',
                  fontSize: FontSize.BIG,
                  margin: const EdgeInsets.only(top: AppDimen.spacing_2),
                )
              ],
            ),
          );
        } else {
          return SizedBox().gridCategory(
            provider.listMyCategories,
            type: CategoryType.MY_CATEGORY,
          );
        }
      }),
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
}
