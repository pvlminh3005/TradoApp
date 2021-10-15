import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trado_app_uit/models/rate_category_model.dart';
import 'package:trado_app_uit/screens/category_detail_screen.dart';

class RatingItemType1 extends StatelessWidget {
  final RateModel rate;
  RatingItemType1(this.rate, {Key? key}) : super(key: key);

  final childrenStars = <Widget>[];
  void _buildRatingStars(ThemeData theme) {
    for (int i = 0; i < 5; i++) {
      if (i < rate.stars)
        childrenStars.add(
          Icon(
            Icons.star_rounded,
            color: theme.highlightColor,
          ),
        );
      else {
        childrenStars.add(
          Icon(
            Icons.star_rounded,
            color: theme.backgroundColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    _buildRatingStars(theme);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryDetailScreen.routeName,
            arguments: rate.idCategory);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                          Text(
                            rate.nameUser,
                            style: theme.textTheme.bodyText1,
                          ),
                          Text(
                            '${DateFormat('dd/MM/yyy kk:mm').format(rate.date)}',
                            style: theme.textTheme.headline2,
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
                              CategoryDetailScreen.routeName,
                              arguments: rate.idCategory);
                        },
                        child: Text(
                          'Xem sản phẩm',
                          style: theme.textTheme.headline2?.merge(
                            TextStyle(
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Row(children: childrenStars),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(rate.comment),
            ],
          ),
        ),
      ),
    );
  }
}
