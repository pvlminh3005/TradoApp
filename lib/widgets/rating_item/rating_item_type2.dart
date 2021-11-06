import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';

import '/models/rate_category_model.dart';

class RatingItemType2 extends StatelessWidget {
  final RateModel rate;
  RatingItemType2(this.rate, {Key? key}) : super(key: key);

  final childrenStars = <Widget>[];
  void _buildRatingStars() {
    for (int i = 0; i < 5; i++) {
      if (i < rate.stars)
        childrenStars.add(
          Icon(
            Icons.star_rounded,
            color: kHighlightColor,
          ),
        );
      else {
        childrenStars.add(
          Icon(
            Icons.star_rounded,
            color: kTextColorGrey.withOpacity(.2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildRatingStars();

    return Card(
      shadowColor: Colors.black54,
      margin: const EdgeInsets.all(5),
      color: kCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.radiusSmall),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        rate.imageUrl,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          rate.nameUser,
                          fontWeight: FontWeight.w700,
                        ),
                        Row(children: childrenStars),
                      ],
                    ),
                  ],
                ),
                CustomText(
                  '${DateFormat('dd/MM/yyy kk:mm').format(rate.date)}',
                  fontSize: FontSize.SMALL,
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomText(rate.comment),
          ],
        ),
      ),
    );
  }
}
