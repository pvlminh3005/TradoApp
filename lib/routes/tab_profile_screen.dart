import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import '/constants/sizes.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
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
    return CustomText(
      title,
      fontSize: FontSize.MEDIUM,
    );
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
        padding: const EdgeInsets.only(top: AppDimen.horizontalSpacing_5),
        color: kCardColor,
        child: Column(
          children: [
            TabBar(
              labelPadding: const EdgeInsets.only(bottom: 5),
              labelColor: kTextDark,
              indicatorColor: kPrimaryColor,
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
