import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/constants/sizes.dart';
import '/extensions/custom_extension.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';

import 'custom_icon.dart';

class CustomSearch extends SearchDelegate {
  final List<dynamic> data;

  final List<String> recentSearch = [
    '1 Ipad',
    '2 Iphone',
    '3 Macbook',
  ];

  CustomSearch({required this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      CustomIcon(Icons.clear,
          margin: const EdgeInsets.symmetric(horizontal: 10), onTap: () {
        query = '';
      })
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
      final dataSearch =
          data.where((e) => e.contains(query.toLowerCase())).toList();
      print('DATA: $dataSearch && LIST: ${data[0]}');
      if (dataSearch.isEmpty) {
        return CustomText('Không tìm thấy kết quả! :(').center();
      }

      return Column(
        children: dataSearch
            .map(
              (e) => ListTile(
                title: CustomText(e),
              ),
            )
            .toList(),
      );
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
