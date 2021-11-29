import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/models/category_model.dart';
import '/providers/category_provider.dart';
import '/widgets/category_item.dart';
import '/widgets/loading_page.dart';

import '/constants/constants.dart';
import '/routes/routes_manage.dart';
import '/widgets/appbar_widget.dart';

class ManageMyCategoryScreen extends StatelessWidget {
  const ManageMyCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoryProvider>(context, listen: false);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: FutureBuilder(
        future: provider.fetchAllCategoriesMyUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            if (snapshot.hasError) {
              return Center(
                child: CustomText('Có lỗi xảy ra'),
              );
            } else {
              return Consumer<CategoryProvider>(builder: (ctx, provider, _) {
                if (provider.listCategories.length == 0) {
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
                          margin:
                              const EdgeInsets.only(top: AppDimen.spacing_2),
                        )
                      ],
                    ),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimen.spacing_1,
                      horizontal: 5,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: provider.listCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      CategoryModel category = provider.listCategories[index];
                      return CategoryItem(
                        category: category,
                        typeCategory: CategoryType.MY_CATEGORY,
                      );
                    },
                  );
                }
              });
            }
          }
        },
      ),
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
