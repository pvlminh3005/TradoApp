import 'package:flutter/material.dart';
import '/widgets/custom_avatar.dart';
import '/models/user_model.dart';

import '/components/custom_button.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/routes/routes_manage.dart';
import '/utils/auth_preferences.dart';
import '/constants/constants.dart';

import '/constants/sizes.dart';

class HeaderInfoProfile extends StatelessWidget {
  final UserModel? profile;
  final bool isMyProfile;

  const HeaderInfoProfile({
    this.profile,
    this.isMyProfile = false,
    Key? key,
  }) : super(key: key);

  Widget _buildAmountFollow(num follow, String content) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: FontSize.SMALL,
          color: kTextDark,
          fontFamily: font_family,
        ),
        children: [
          TextSpan(
            text: '$follow ',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: content),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kCardColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimen.horizontalSpacing_16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await AuthPreferences.removeToken();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteManage.splash,
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: CustomAvatar(
                    imageUrl: profile!.imageUrl!,
                    radius: 40,
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoAccount(
                      name: profile!.name!,
                      countPerStars: profile!.countPerStars,
                      countRating: profile!.countRating,
                    ),
                    _buildAmountFollow(profile!.fame, 'quan tâm'),
                  ],
                ),
              ],
            ),
          ),
          !isMyProfile
              ? _buildButtonProfile()
              : const SizedBox(height: AppDimen.spacing_1),
        ],
      ),
    );
  }

  _buildButtonProfile() {
    return Row(
      children: [
        Flexible(
          child: CustomButton(
            'Quan tâm',
            margin: const EdgeInsets.all(AppDimen.spacing_1),
            padding: const EdgeInsets.symmetric(
                vertical: AppDimen.verticalSpacing_10),
            radius: AppDimen.radiusBig_1,
            textColor: kTextLight,
            backgroundColor: kPrimaryColor,
            fontSize: FontSize.MEDIUM,
            onTap: () {
              print('Quan Tam');
            },
          ),
        ),
        Flexible(
          child: CustomButton(
            'Báo cáo',
            textColor: kTextDark,
            padding: const EdgeInsets.symmetric(
                vertical: AppDimen.verticalSpacing_10),
            margin: const EdgeInsets.all(AppDimen.spacing_1),
            backgroundColor: kBackgroundColor,
            radius: AppDimen.radiusBig_1,
            fontSize: FontSize.MEDIUM,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _buildInfoAccount extends StatelessWidget {
  final String name;
  final double countPerStars;
  final int countRating;

  const _buildInfoAccount({
    required this.name,
    this.countPerStars = 0,
    this.countRating = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          name,
          fontSize: FontSize.BIG,
          fontWeight: FontWeight.w700,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              size: 22,
              color: kHighlightColor,
            ),
            CustomText(
              '$countPerStars ($countRating)',
              color: kHighlightColor,
            ),
          ],
        ),
      ],
    );
  }
}
