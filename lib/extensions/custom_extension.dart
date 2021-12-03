import 'package:flutter/material.dart';
import '/constants/dimen.dart';
import '/models/category_model.dart';
import '/widgets/category_item.dart';

extension CustomExtension on Widget {
  Widget center() {
    return Center(child: this);
  }

  Widget gridCategory(
    List<CategoryModel> data, {
    CategoryType type = CategoryType.ANOTHER_CATEGORY,
  }) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimen.verticalSpacing_10,
        horizontal: AppDimen.horizontalSpacing_5,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
        mainAxisSpacing: AppDimen.spacing_1 + 2,
        crossAxisSpacing: AppDimen.spacing_1,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        CategoryModel category = data[index];
        return CategoryItem(
          category: category,
          typeCategory: type,
        );
      },
    );
  }
}
