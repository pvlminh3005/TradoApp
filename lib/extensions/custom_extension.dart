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
  }) {
    // return GridView.builder(
    //   padding: const EdgeInsets.symmetric(
    //     vertical: AppDimen.verticalSpacing_10,
    //     horizontal: AppDimen.horizontalSpacing_5,
    //   ),
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     childAspectRatio: 1 / 1.5,
    //     mainAxisSpacing: AppDimen.spacing_1 + 2,
    //     crossAxisSpacing: AppDimen.spacing_1,
    //   ),
    //   itemCount: data.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     CategoryModel category = data[index];
    //     if (data.length == 0) {
    //       return Center(
    //         child: CustomText('Không có sản phẩm nào'),
    //       );
    //     }
    //     return CategoryItem(
    //       category: category,
    //       typeCategory: type,
    //     );
    //   },
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimen.spacing_1,
        horizontal: AppDimen.horizontalSpacing_5,
      ),
      child: Wrap(
        spacing: AppDimen.horizontalSpacing_5,
        runSpacing: AppDimen.verticalSpacing_10,
        children: data.map((category) {
          return CategoryItem(
            category: category,
            typeCategory: type,
          );
        }).toList(),
      ),
    );
  }
}
