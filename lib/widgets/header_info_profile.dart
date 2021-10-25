import 'package:flutter/material.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/utils/auth_preferences.dart';
import '/constants/constants.dart';

import '/constants/sizes.dart';
import 'grid_button.dart';

class HeaderInfoProfile extends StatelessWidget {
  const HeaderInfoProfile({Key? key}) : super(key: key);

  Widget _buildAmountFollow(num follow, String content) {
    return RichText(
      text: TextSpan(
        style: kTextMediumDark_14,
        children: [
          TextSpan(
            text: (follow is int)
                ? '$follow '
                : '${(follow * 100).toStringAsFixed(0)}% ',
            style: kTextBoldDark_14,
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
                    print('Sign out');
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
          GridButton(),
        ],
      ),
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
        Text(
          name,
          style: kTextBoldDark_18,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              size: 22,
              color: kHighlightColor,
            ),
            Text(
              '$countPerStars',
              style: kTextHighlight_16,
            ),
            Text(
              ' ($countRating)',
              style: kTextHighlight_16,
            ),
          ],
        ),
      ],
    );
  }
}
