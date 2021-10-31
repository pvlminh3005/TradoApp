import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import '/components/card_shadow.dart';
import '/components/custom_text.dart';
import '/constants/sizes.dart';

class CardInfoProfileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function(BuildContext)? onTap;

  const CardInfoProfileWidget({
    this.title = '',
    this.subtitle = '',
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      padding: const EdgeInsets.all(AppDimen.spacing_2),
      height: 80.0,
      onTap: () => onTap!(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(height: 5),
              _buildSubtitle(),
            ],
          ),
          _buildIcon(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return CustomText(
      title,
      fontSize: FontSize.BIG,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _buildSubtitle() {
    if (subtitle.isEmpty) return SizedBox.shrink();
    return CustomText(
      subtitle,
      color: kTextColorGrey,
      fontSize: FontSize.SMALL,
    );
  }

  Widget _buildIcon() {
    return Icon(
      CupertinoIcons.chevron_forward,
      size: AppDimen.icon_size_small,
      color: kTextColorGrey,
    );
  }
}
