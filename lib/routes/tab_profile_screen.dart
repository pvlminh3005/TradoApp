import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/models/user_model.dart';
import '/constants/sizes.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '../widgets/categories_profile.dart';
import '../widgets/info_profile.dart';
import '../widgets/rating.dart';

class TabScreen extends StatelessWidget {
  final UserModel? profile;
  final String? idUser;

  const TabScreen({
    Key? key,
    this.profile,
    this.idUser = '',
  }) : super(key: key);

  Widget _buildTitleTab(String title) {
    return CustomText(
      title,
      fontSize: FontSize.MEDIUM - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                _buildTitleTab('Sản phẩm'),
                _buildTitleTab('Đánh giá'),
              ],
            ),
            // BodyContent(),
            Expanded(
              child: TabBarView(
                children: [
                  InfoWidget(profile: profile),
                  CategoriesWidget(idUser: idUser),
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
