import 'package:flutter/material.dart';
import 'package:trado_app_uit/screens/message/message_detail_screen.dart';
import '/widgets/custom_avatar.dart';
import '/models/user_model.dart';

import '/components/custom_button.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/routes/routes_manage.dart';
import '/utils/auth_preferences.dart';
import '/constants/constants.dart';

import '/constants/sizes.dart';

class HeaderInfoProfile extends StatefulWidget {
  late UserModel? profile;
  final bool isMyProfile;

  HeaderInfoProfile({
    this.profile,
    this.isMyProfile = false,
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderInfoProfile> createState() => _HeaderInfoProfileState();
}

class _HeaderInfoProfileState extends State<HeaderInfoProfile> {
  bool follow = false;
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
    if (widget.profile == null) return const SizedBox.shrink();
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
                  onTap: () async {},
                  child: CustomAvatar(
                    imageUrl: widget.profile!.imageUrl!,
                    radius: 40,
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoAccount(
                      name: widget.profile!.name!,
                      countPerStars: widget.profile!.countPerStars!,
                      countRating: widget.profile!.countRating!,
                    ),
                    _buildAmountFollow(widget.profile!.fame!, 'quan tâm'),
                  ],
                ),
              ],
            ),
          ),
          !widget.isMyProfile
              ? _buildButtonProfile(context)
              : const SizedBox(height: AppDimen.spacing_1),
        ],
      ),
    );
  }

  _buildButtonProfile(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CustomButton(
            follow ? 'Đang quan tâm' : 'Quan tâm',
            margin: const EdgeInsets.all(AppDimen.spacing_1),
            padding: const EdgeInsets.symmetric(
                vertical: AppDimen.verticalSpacing_10),
            radius: AppDimen.radiusBig_1,
            textColor: follow ? Colors.white : kTextLight,
            backgroundColor: follow ? kColorGreen : kPrimaryColor,
            fontSize: FontSize.MEDIUM,
            onTap: () {
              setState(() {
                follow = !follow;
              });
            },
          ),
        ),
        Flexible(
          child: CustomButton(
            'Nhắn tin',
            textColor: kTextDark,
            padding: const EdgeInsets.symmetric(
                vertical: AppDimen.verticalSpacing_10),
            margin: const EdgeInsets.all(AppDimen.spacing_1),
            backgroundColor: kBackgroundColor,
            radius: AppDimen.radiusBig_1,
            fontSize: FontSize.MEDIUM,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    MessageDetailScreen(title: widget.profile!.name),
              ));
            },
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
