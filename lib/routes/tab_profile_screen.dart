import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '/providers/rate_review_provider.dart';
import '../providers/category_provider.dart';
import '../widgets/categories_profile.dart';
import '../widgets/info_profile.dart';
import '../widgets/rating.dart';

class TabScreen extends StatelessWidget {
  final List<Widget> _pages = [
    InfoWidget(),
    CategoriesWidget(),
    RatingWidget(),
  ];

  Widget _buildTitleTab(String title) {
    return Text(title, style: kTextMediumDark_15);
  }

  @override
  Widget build(BuildContext context) {
    final providerCategory =
        Provider.of<CategoryProvider>(context, listen: false);
    int amountRates = Provider.of<RateReviewProvider>(context, listen: false)
        .listRates
        .length;
    return DefaultTabController(
      length: _pages.length,
      child: Container(
        color: kCardColor,
        child: Column(
          children: [
            TabBar(
              labelPadding: const EdgeInsets.only(bottom: 5),
              labelColor: Colors.black,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                _buildTitleTab('Thông tin'),
                _buildTitleTab(
                    'Mặt hàng (${providerCategory.listCategories.length})'),
                _buildTitleTab('Đánh giá (${amountRates})'),
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
