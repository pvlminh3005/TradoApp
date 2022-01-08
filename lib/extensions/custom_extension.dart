import 'package:flutter/material.dart';
import '/components/custom_text.dart';
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
    ScrollController? scrollCtrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimen.spacing_1,
        horizontal: AppDimen.horizontalSpacing_5,
      ),
      child: SingleChildScrollView(
        controller: scrollCtrl,
        child: Wrap(
          spacing: AppDimen.horizontalSpacing_10,
          runSpacing: AppDimen.spacing_2,
          children: data.map((category) {
            return CategoryItem(
              category: category,
              typeCategory: type,
            );
          }).toList(),
        ),
      ),
    );
  }
}
