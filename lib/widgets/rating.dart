import 'package:flutter/material.dart';
import '../models/rate_category_model.dart';
import 'rating_item.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ListView.builder(
        itemCount: listRates.length,
        itemBuilder: (BuildContext context, int index) {
          RateModel rate = listRates[index];
          return RatingItem(rate);
        },
      ),
    );
  }
}
