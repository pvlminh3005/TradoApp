import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_text.dart';
import 'package:trado_app_uit/constants/sizes.dart';

import '/constants/constants.dart';
import '/models/rate_category_model.dart';
import '/providers/category_provider.dart';
import '/providers/rate_review_provider.dart';
import '/widgets/rating_item/rating_item_type2.dart';
import '/models/category_model.dart';
import '/widgets/appbar_widget.dart';

enum FilterOptions {
  All,
  FiveStars,
  FourStars,
  ThreeStars,
  TwoStars,
  OneStar,
}

class RatingAndReviewScreen extends StatefulWidget {
  const RatingAndReviewScreen({Key? key}) : super(key: key);

  @override
  State<RatingAndReviewScreen> createState() => _RatingAndReviewScreenState();
}

class _RatingAndReviewScreenState extends State<RatingAndReviewScreen> {
  bool _showFavorite = false;

  PopupMenuItem _buildPopupMenuFilter(
      int amountStars, int total, ThemeData theme) {
    return PopupMenuItem(
      child: Row(
        children: [
          Row(
            children: List.generate(
              5,
              (index) {
                return Icon(
                  Icons.star_rate_rounded,
                  color: index < amountStars
                      ? kHighlightColor
                      : kTextColorGrey.withOpacity(.3),
                );
              },
            ),
          ),
          SizedBox(width: 3),
          Text(total.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String idCategory = ModalRoute.of(context)?.settings.arguments as String;
    List<RateModel> listRates =
        Provider.of<RateReviewProvider>(context, listen: false)
            .findRateByIdCategory(idCategory);

    return Scaffold(
      appBar: AppBarWidget(
        background: Colors.white,
        color: kPrimaryColor,
        title: 'Nhận xét & đánh giá (${listRates.length})',
      ),
      body: Column(
        children: [
          HeaderInfo(idCategory: idCategory),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Container(
                //   alignment: Alignment.topRight,
                //   child: PopupMenuButton(
                //     padding: const EdgeInsets.all(5),
                //     // onSelected: (FilterOptions selectedValue) {
                //     //   setState(() {
                //     //     switch (selectedValue) {
                //     //       case FilterOptions.All:
                //     //         _showFavorite = false;
                //     //         break;
                //     //       default:
                //     //         break;
                //     //     }
                //     //   });
                //     // },
                //     icon: Icon(
                //       Icons.filter_list_outlined,
                //       color: theme.textSelectionColor,
                //       size: 25,
                //     ),
                //     itemBuilder: (_) => [
                //       PopupMenuItem(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               'All',
                //               style: theme.textTheme.bodyText1,
                //             ),
                //             Icon(
                //               Icons.arrow_forward_ios_rounded,
                //               size: 15,
                //             ),
                //           ],
                //         ),
                //         value: FilterOptions.All,
                //       ),
                //       _buildPopupMenuFilter(5, 10, theme),
                //       _buildPopupMenuFilter(4, 8, theme),
                //       _buildPopupMenuFilter(3, 6, theme),
                //       _buildPopupMenuFilter(2, 5, theme),
                //       _buildPopupMenuFilter(1, 4, theme),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listRates.length,
                    itemBuilder: (BuildContext context, int index) {
                      RateModel rate = listRates[index];
                      return RatingItemType2(rate);
                    },
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class HeaderInfo extends StatelessWidget {
  final String idCategory;
  const HeaderInfo({
    required this.idCategory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CategoryModel category =
        Provider.of<CategoryProvider>(context, listen: false)
            .findCategoryById(idCategory);

    return Container(
      padding: const EdgeInsets.all(10.0),
      color: kCardColor,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              category.imageUrl[0],
              width: size.width * .25,
              height: size.width * .25,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 7),
          Consumer<RateReviewProvider>(builder: (ctx, rate, _) {
            double amountStars = rate.amountRates(idCategory)['rating'];
            int amountViews = rate.amountRates(idCategory)['review'];
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    category.title,
                    maxLines: 2,
                    fontSize: FontSize.BIG,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 6),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color:
                            amountViews == 0 ? kTextColorGrey : kHighlightColor,
                        size: 30,
                      ),
                      CustomText('${amountStars.toStringAsFixed(1)}'),
                    ],
                  ),
                  const SizedBox(height: 6),
                  CustomText(
                    '(${amountViews} nhận xét)',
                    color: kTextColorGrey,
                    fontSize: FontSize.SMALL,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
