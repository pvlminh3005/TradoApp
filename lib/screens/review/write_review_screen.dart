import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '/components/custom_refresh_page.dart';
import '/constants/sizes.dart';
import '/components/custom_text.dart';
import '/components/primary_button.dart';
import '/constants/constants.dart';
import '/components/custom_input.dart';
import '/constants/dimen.dart';
import '/widgets/appbar_widget.dart';

import 'rating_and_review_screen.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  _WriteReviewScreenState createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  final reviewKey = GlobalKey<FormState>();
  double rateStars = 0.0;
  bool hideName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Viết đánh giá',
        showCart: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDimen.verticalSpacing_10),
          child: Form(
            key: reviewKey,
            child: Column(
              children: [
                HeaderInfo(idCategory: 'c1'),
                const SizedBox(height: 10.0),
                _buildRateStars(),
                CustomInput(
                  hintText: 'Viết đánh giá',
                  maxLines: 10,
                ),
                _buildSwitchName(),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRateStars() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: RatingBar.builder(
        initialRating: rateStars,
        minRating: 1,
        direction: Axis.horizontal,
        itemCount: 5,
        itemPadding:
            EdgeInsets.symmetric(horizontal: AppDimen.horizontalSpacing_5),
        itemSize: 50,
        itemBuilder: (context, _) => Icon(
          Icons.star_rate_rounded,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          setState(() {
            rateStars = rating;
          });
        },
      ),
    );
  }

  Widget _buildSwitchName() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Đánh giá ẩn danh',
                color: kTextColorGrey,
                fontWeight: FontWeight.w700,
              ),
              CustomText(
                '(Tài khoản của bạn sẽ được đặt thành *****m)',
                color: kTextColorGrey,
                fontSize: FontSize.MEDIUM - 1,
                maxLines: 2,
              ),
            ],
          ),
          Switch(
            value: hideName,
            onChanged: (value) {
              setState(() {
                hideName = value;
              });
            },
            activeColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return PrimaryButton(
      title: 'Đánh giá',
      backgroundColor: rateStars != 0 ? kPrimaryColor : kColorItemGrey,
      showShadow: rateStars != 0 ? true : false,
      onPressed: rateStars != 0
          ? () async {
              await Future.delayed(Duration(seconds: 3));
            }
          : () {},
    );
  }
}
