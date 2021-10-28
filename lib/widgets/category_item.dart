import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/config_price.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '/routes/routes_manage.dart';
import '/components/sale_component.dart';
import '/providers/rate_review_provider.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({required this.category, Key? key}) : super(key: key);

  Widget _buildFooterItem(IconData icon, String data) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: kTextColorGrey,
          ),
          SizedBox(width: 5),
          CustomText(
            data,
            fontSize: FontSize.SMALL,
            fontWeight: FontWeight.w700,
            color: kTextColorGrey,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map<String, dynamic> rate =
        Provider.of<RateReviewProvider>(context, listen: false)
            .amountRates(category.id);

    double priceDecreaseSale = category.priceSale != 0
        ? (category.price * (100 - category.priceSale) / 100)
        : category.price;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        RouteManage.category_detail,
        arguments: category.id,
      ),
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 15,
              child: Container(
                padding: const EdgeInsets.only(top: 25),
                constraints: BoxConstraints(
                  minHeight: Platform.isIOS ? 105 : 120,
                ),
                width: size.width * .45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kCardColor,
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
                      CustomText(
                        category.title,
                        fontSize: FontSize.SMALL,
                      ),

                      //Widget Price & Sale
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            '${FormatPrice(priceDecreaseSale)} đ',
                            fontWeight: FontWeight.w700,
                            color: category.priceSale != 0
                                ? kErrorColor
                                : kTextDark,
                          ),
                          const SizedBox(width: 10),
                          category.priceSale != 0
                              ? SaleComponent(text: category.priceSale)
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
                                color: rate['rating'] != 0
                                    ? kHighlightColor
                                    : kTextColorGrey,
                                size: 20,
                              ),
                              CustomText(
                                '${rate['rating'].toStringAsFixed(1)}',
                                fontSize: FontSize.SMALL,
                              ),
                              const SizedBox(width: 10),
                              CustomText(
                                '(${rate['review']} nhận xét)',
                                fontSize: FontSize.SMALL,
                                color: kTextColorGrey,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildFooterItem(
                                Icons.remove_red_eye,
                                0.toString(),
                              ),
                              _buildFooterItem(
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
                color: kCardColor,
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
