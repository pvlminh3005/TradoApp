import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';

import 'custom_icon.dart';
import 'custom_text.dart';

class DataSearch extends SearchDelegate<String> {
  final dynamic data;
  DataSearch({required this.data});

  @override
  String? get searchFieldLabel => 'Tìm kiếm...';

  @override
  TextStyle? get searchFieldStyle => TextStyle(
        fontSize: FontSize.BIG,
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: CustomIcon(
          Icons.clear,
        ),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        CupertinoIcons.back,
        size: AppDimen.icon_size_small,
        color: kPrimaryColor,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 1,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Image.asset(
              'assets/images/background_blue.jpeg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: AppDimen.spacing_1),
            Expanded(
              child: CustomText(
                'Xin chaoo $index',
                maxLines: 3,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Text('$index');
      },
    );
  }
}
