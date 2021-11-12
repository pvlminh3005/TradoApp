import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import 'package:trado_app_uit/models/category_model.dart';
import 'package:trado_app_uit/providers/auth_provider.dart';
import 'package:trado_app_uit/providers/category_provider.dart';
import 'package:trado_app_uit/widgets/category_item.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';

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
      body: FutureBuilder<List<CategoryModel>>(
        future: provider.fetchAllCategoriesMyUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            if (snapshot.data == null) {
              return Center(
                child: CustomText('Có lỗi xảy ra'),
              );
            } else {
              List<CategoryModel> listCategories = snapshot.data;

              if (listCategories.length == 0) {
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
              }
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimen.spacing_1,
                  horizontal: 5,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: listCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  CategoryModel category = listCategories[index];
                  return CategoryItem(category: category);
                },
              );
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
