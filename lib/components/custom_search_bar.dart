import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/category_model.dart';
import '/extensions/custom_extension.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';

import 'custom_icon.dart';

class CustomSearch extends SearchDelegate {
  final List<CategoryModel> data;

  final List<String> recentSearch = [
    'Sony',
    '911',
  ];

  CustomSearch({required this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      CustomIcon(
        Icons.clear,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        onTap: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return CustomIcon(
      CupertinoIcons.back,
      color: kPrimaryColor,
      onTap: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      List<CategoryModel> dataSearch = data
          .where((category) =>
              category.title.toUpperCase().contains(query.toUpperCase()))
          .toList();
      if (dataSearch.isEmpty) {
        return CustomText('Không tìm thấy kết quả! :(').center();
      }

      return SizedBox().gridCategory(dataSearch);
    } else {
      return CustomText('');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: recentSearch.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildSearchItem(recentSearch[index]);
      },
    );
  }

  Widget _buildSearchItem(String title) {
    return ListTile(
      title: CustomText(title),
      trailing: CustomIcon(
        CupertinoIcons.right_chevron,
        size: AppDimen.icon_size_small,
      ),
      onTap: () {
        query = title;
      },
    );
  }
}
