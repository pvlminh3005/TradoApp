import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants/constants.dart';
import '/providers/rate_review_provider.dart';
import '../models/rate_category_model.dart';
import 'rating_item/rating_item_type1.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RateModel> listRates =
        Provider.of<RateReviewProvider>(context, listen: false).listRates;

    return Scaffold(
      backgroundColor: kBackgroundColor,
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
