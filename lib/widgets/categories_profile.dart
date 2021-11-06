import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/dimen.dart';

import '/constants/constants.dart';
import '/providers/category_provider.dart';
import '../models/category_model.dart';
import './category_item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> _listCategories =
        Provider.of<CategoryProvider>(context, listen: false).listCategories;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimen.verticalSpacing_10, horizontal: 5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemCount: _listCategories.length,
          itemBuilder: (BuildContext context, int index) {
            CategoryModel category = _listCategories[index];
            return CategoryItem(category: category);
          },
        ),
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
