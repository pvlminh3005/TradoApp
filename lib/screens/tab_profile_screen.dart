import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../models/rate_category_model.dart';
import '../widgets/categories_profile.dart';
import '../widgets/info_profile.dart';
import '../widgets/rating.dart';

class TabScreen extends StatelessWidget {
  final List<Widget> _pages = [
    InfoWidget(),
    CategoriesWidget(),
    RatingWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final providerCategory =
        Provider.of<CategoryProvider>(context, listen: false);
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: _pages.length,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            TabBar(
              labelPadding: const EdgeInsets.only(bottom: 5),
              labelColor: Colors.black,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Text('Thông tin', style: theme.textTheme.bodyText2),
                Text('Mặt hàng (${providerCategory.listCategories.length})',
                    style: theme.textTheme.bodyText2),
                Text('Đánh giá (${listRates.length})',
                    style: theme.textTheme.bodyText2),
              ],
            ),
            // BodyContent(),
            Expanded(
              child: TabBarView(
                children: [
                  InfoWidget(),
                  CategoriesWidget(),
                  RatingWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
