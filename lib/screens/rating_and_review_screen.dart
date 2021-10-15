import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  static const routeName = '/rating_review';
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
                      ? theme.highlightColor
                      : theme.textSelectionColor.withOpacity(.3),
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

  PopupMenuItem _builPopupMenuItem(
      int amountStars, int total, Function() onPressed) {
    return PopupMenuItem(
      child: Row(
        children: [
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star_rate_rounded,
              ),
            ),
          ),
          Text('($total)'),
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
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    CategoryModel category =
        Provider.of<CategoryProvider>(context, listen: false)
            .findCategoryById(idCategory);

    return Container(
      padding: const EdgeInsets.all(10.0),
      color: theme.cardColor,
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
          SizedBox(width: 5),
          Consumer<RateReviewProvider>(builder: (ctx, rate, _) {
            double amountStars = rate.amountRates(idCategory)['rating'];
            int amountViews = rate.amountRates(idCategory)['review'];
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    category.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyText1,
                  ),
                  SizedBox(height: 6),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: amountViews == 0
                            ? theme.textSelectionColor
                            : theme.highlightColor,
                      ),
                      Text('${amountStars.toStringAsFixed(1)}'),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    '(${amountViews} nhận xét)',
                    style: theme.textTheme.headline2?.merge(
                      TextStyle(color: Colors.grey),
                    ),
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
