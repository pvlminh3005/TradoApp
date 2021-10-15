import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/providers/rate_review_provider.dart';
import '../models/rate_category_model.dart';
import 'rating_item/rating_item_type1.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RateModel> listRates =
        Provider.of<RateReviewProvider>(context, listen: false).listRates;

    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ListView.builder(
        itemCount: listRates.length,
        itemBuilder: (BuildContext context, int index) {
          RateModel rate = listRates[index];
          return RatingItemType1(rate);
        },
      ),
    );
  }
}
