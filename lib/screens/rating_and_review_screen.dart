import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/models/rate_category_model.dart';
import 'package:trado_app_uit/providers/rate_review_provider.dart';
import '/models/category_model.dart';
import '/widgets/appbar_widget.dart';

class RatingAndReviewScreen extends StatelessWidget {
  static const routeName = '/rating_review';
  const RatingAndReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryModel category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    List<RateModel> listRates =
        Provider.of<RateReviewProvider>(context, listen: false)
            .findRateByIdCategory(category.id);
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWidget(
        background: Colors.white,
        color: theme.primaryColor,
        title: 'Nhận xét & đánh giá (${listRates.length})',
      ),
      body: Column(
        children: [
          HeaderInfo(category: category),
          Expanded(
              child: Container(
            child: const Text('Hi'),
          )),
        ],
      ),
    );
  }
}

class HeaderInfo extends StatelessWidget {
  final CategoryModel category;
  const HeaderInfo({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  category.imageUrl[0],
                  width: size.width * .2,
                  height: size.width * .2,
                  fit: BoxFit.cover,
                ),
              ),
              // Expanded(
              //   child: Row(
              //     children: [
              //       Column(
              //         children: [
              //           Row(
              //             children: [
              //               Text('${category.amoutComment} nhận xét'),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
