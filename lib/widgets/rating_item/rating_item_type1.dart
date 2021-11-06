import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/constants/sizes.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/routes/routes_manage.dart';

import '/constants/constants.dart';
import '/models/rate_category_model.dart';

class RatingItemType1 extends StatelessWidget {
  final RateModel rate;
  RatingItemType1(this.rate, {Key? key}) : super(key: key);

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

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteManage.category_detail,
          arguments: rate.idCategory,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          CustomText(
                            rate.nameUser,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            '${DateFormat('dd/MM/yyy kk:mm').format(rate.date)}',
                            fontSize: FontSize.SMALL,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            RouteManage.category_detail,
                            arguments: rate.idCategory,
                          );
                        },
                        child: CustomText(
                          'Xem sản phẩm',
                          fontSize: FontSize.SMALL,
                          color: kPrimaryColor,
                        ),
                      ),
                      Row(children: childrenStars),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomText(rate.comment),
            ],
          ),
        ),
      ),
    );
  }
}
