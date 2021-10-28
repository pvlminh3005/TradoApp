import 'package:flutter/material.dart';
import '/components/custom_button.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/routes/routes_manage.dart';
import '/utils/auth_preferences.dart';
import '/constants/constants.dart';

import '/constants/sizes.dart';

class HeaderInfoProfile extends StatelessWidget {
  const HeaderInfoProfile({Key? key}) : super(key: key);

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
            text: (follow is int)
                ? '$follow '
                : '${(follow * 100).toStringAsFixed(0)}% ',
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  child: CircleAvatar(
                    radius: size.width * .1,
                    backgroundImage:
                        AssetImage('assets/images/background_blue.jpeg'),
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoAccount(
                      name: 'Le Minh',
                      countPerStars: 4,
                      countRating: 21,
                    ),
                    Row(
                      children: [
                        _buildAmountFollow(100, 'quan tâm'),
                        SizedBox(width: 8.0),
                        _buildAmountFollow(1.0, 'phản hồi'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildButtonProfile(),
        ],
      ),
    );
  }

  _buildButtonProfile() {
    return Row(
      children: [
        Flexible(
          child: CustomButton(
            title: 'Quan tâm',
            margin: AppDimen.spacing_1,
            radius: AppDimen.radiusBig,
            textColor: kTextLight,
            backgroundColor: kPrimaryColor,
            onTap: () {},
          ),
        ),
        Flexible(
          child: CustomButton(
            title: 'Báo cáo',
            textColor: kTextDark,
            margin: AppDimen.spacing_1,
            backgroundColor: kColorItemGrey,
            radius: AppDimen.radiusBig,
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
    this.countPerStars = 5,
    required this.countRating,
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
              '$countPerStars',
              color: kHighlightColor,
            ),
            CustomText(
              ' ($countRating)',
              color: kHighlightColor,
            ),
          ],
        ),
      ],
    );
  }
}
