import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import '/components/custom_image_network.dart';
import '/components/custom_icon.dart';
import '/screens/category/category_detail_screen.dart';
import '/screens/category/edit_my_category_screen.dart';
import '/constants/dimen.dart';
import '/components/config_price.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '/components/sale_component.dart';
import '/providers/rate_review_provider.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final CategoryType typeCategory;

  const CategoryItem({
    required this.category,
    this.typeCategory = CategoryType.ANOTHER_CATEGORY,
    Key? key,
  }) : super(key: key);

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
    Map<String, dynamic> rate =
        Provider.of<RateReviewProvider>(context, listen: false)
            .amountRates(category.id);

    int priceDecreaseSale = category.priceSale != 0
        ? (category.price * (100 - category.priceSale) ~/ 100)
        : category.price;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CategoryDetailScreen(
            idCategory: category.id,
            typeCategory: category.idUser == AuthController.idUser
                ? CategoryType.MY_CATEGORY
                : CategoryType.ANOTHER_CATEGORY,
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - AppDimen.spacing_1,
        height: 280.0,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 1.0),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                    tag: '${category.id}',
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.srcATop),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDimen.radiusNormal),
                            child: category.imageUrl.isEmpty
                                ? _buildImageEmpty()
                                : _buildImageNetwork(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  typeCategory == CategoryType.MY_CATEGORY
                      ? Positioned(
                          right: 5,
                          top: 5,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => EditMyCategoryScreen(
                                    category: category,
                                    type: EditCategoryType.EDITCATEGORY,
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: AppDimen.icon_size_small,
                              backgroundColor: kPrimaryColor.withOpacity(.6),
                              child: CustomIcon(
                                Icons.edit,
                                color: kBackgroundColorWhite.withOpacity(.8),
                                size: AppDimen.icon_size_small,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  !category.status ? _buildSoldOut() : const SizedBox.shrink()
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimen.spacing_1,
                  horizontal: AppDimen.horizontalSpacing_10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(AppDimen.radiusNormal),
                    bottomRight: const Radius.circular(AppDimen.radiusNormal),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      category.title,
                      fontSize: FontSize.SMALL + 1,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                    ),

                    //Widget Price & Sale
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            '${FormatPrice(priceDecreaseSale)} đ',
                            fontWeight: FontWeight.w700,
                            color: category.priceSale != 0
                                ? kErrorColor
                                : kTextDark,
                          ),
                          const SizedBox(width: 8.0),
                          category.priceSale != 0
                              ? SaleComponent(text: category.priceSale)
                              : SizedBox.shrink(),
                        ],
                      ),
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     _buildFooterItem(
                        //       Icons.remove_red_eye,
                        //       0.toString(),
                        //     ),
                        //     _buildFooterItem(
                        //       Icons.near_me_outlined,
                        //       '< 4km',
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageEmpty() {
    return Image(
      width: double.infinity,
      height: 180,
      fit: BoxFit.cover,
      image: AssetImage('assets/images/empty_image.jpeg'),
    );
  }

  Widget _buildImageNetwork() {
    return CustomImageNetWork(
      image: category.imageUrl[0],
      height: 180,
      width: double.infinity,
    );
  }

  Widget _buildSoldOut() {
    return Container(
      padding: const EdgeInsets.all(AppDimen.spacing_1 - 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: kErrorColor,
          width: 1.5,
        ),
      ),
      child: CustomText(
        'Hết hàng',
        color: kErrorColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
