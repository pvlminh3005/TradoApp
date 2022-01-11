import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/loading/loading_app.dart';
import 'package:trado_app_uit/utils/conver_scaffold_messenger.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';
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
          runSpacing: AppDimen.verticalSpacing_10,
          children: data.mapIndexed((category, index) {
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

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, ++i));
  }
}
