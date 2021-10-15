import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trado_app_uit/components/sale_component.dart';
import 'package:trado_app_uit/screens/category_detail_screen.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({required this.category, Key? key}) : super(key: key);

  Widget _buildFooterItem(ThemeData theme, IconData icon, String data) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: theme.textSelectionColor,
          ),
          SizedBox(width: 5),
          Text(
            data,
            style: theme.textTheme.headline2?.merge(
              TextStyle(
                color: theme.textSelectionColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    double priceDecreaseSale = category.priceSale != 0
        ? (category.price * (100 - category.priceSale) / 100)
        : category.price;

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(CategoryDetailScreen.routeName, arguments: category.id),
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 15,
              child: Container(
                padding: const EdgeInsets.only(top: 25),
                constraints: BoxConstraints(
                  minHeight: 120,
                ),
                width: size.width * .45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: theme.cardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: theme.textTheme.headline2,
                      ),

                      //Widget Price & Sale
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${NumberFormat.currency(
                              locale: 'id',
                              decimalDigits: 0,
                              symbol: '',
                            ).format(priceDecreaseSale)} đ',
                            style: theme.textTheme.bodyText1?.merge(
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                color: category.priceSale != 0
                                    ? theme.errorColor
                                    : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          category.priceSale != 0
                              ? SaleComponent(
                                  text: category.priceSale,
                                  textStyle: theme.textTheme.subtitle1?.merge(
                                    TextStyle(
                                      color: theme.errorColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //stars & review
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: theme.highlightColor,
                                size: 20,
                              ),
                              Text(
                                '${category.amountVoteStars.toStringAsFixed(1)}',
                                style: theme.textTheme.headline2,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '(${category.amoutComment} nhận xét)',
                                style: theme.textTheme.headline2?.merge(
                                  TextStyle(color: theme.textSelectionColor),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildFooterItem(
                                theme,
                                Icons.remove_red_eye,
                                0.toString(),
                              ),
                              _buildFooterItem(
                                theme,
                                Icons.near_me_outlined,
                                '< 4km',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-1, 2.0),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: '${category.id}',
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.srcATop),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          width: size.width * .42,
                          height: 180,
                          fit: BoxFit.cover,
                          image: NetworkImage(category.imageUrl[0]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
