import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    Size size = MediaQuery.of(context).size;
    _buildRatingStars();

    return Card(
      shadowColor: Colors.black54,
      margin: const EdgeInsets.all(5),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
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
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rate.nameUser,
                          style: kTextBoldDark_16,
                        ),
                        Row(children: childrenStars),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${DateFormat('dd/MM/yyy kk:mm').format(rate.date)}',
                  style: kTextMediumDark_14,
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(rate.comment, style: kTextMediumDark_16),
          ],
        ),
      ),
    );
  }
}
