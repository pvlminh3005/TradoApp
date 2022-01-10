import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '/utils/conver_scaffold_messenger.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/routes/routes_manage.dart';
import '/constants/sizes.dart';
import '/components/config_price.dart';
import '/components/sale_component.dart';
import '/constants/constants.dart';
import '/providers/rate_review_provider.dart';

import '../../widgets/appbar_widget.dart';
import '../../widgets/scroll_hide_widget.dart';
import '../../widgets/bottom_category_detail.dart';
import '../../models/category_model.dart';
import '../../providers/category_provider.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String? idCategory;
  final CategoryType typeCategory;

  CategoryDetailScreen({
    this.idCategory,
    this.typeCategory = CategoryType.ANOTHER_CATEGORY,
    Key? key,
  }) : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int activeIndex = 0; //page indicator image
  int quantityCategory = 1;
  bool isReadMore = false;
  late ScrollController _scrollController;
  late CategoryModel category;

  Widget _buildImagesSlide(Size size, CategoryModel category) {
    return Hero(
      transitionOnUserGestures: true,
      tag: '${category.id}',
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Platform.isIOS ? size.height * .55 : size.height * .45,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 5,
                )
              ],
            ),
            child: CarouselSlider.builder(
              itemCount: category.imageUrl.length,
              itemBuilder: (ctx, index, realIndex) {
                return _buildImageSlide(category: category, index: index);
              },
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                enlargeCenterPage: true,
                viewportFraction: 1,
                disableCenter: true,
              ),
            ),
          ),
          !category.status ? _buildSoldOut() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildSoldOut() {
    return Container(
      padding: const EdgeInsets.all(AppDimen.spacing_1),
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
        fontSize: FontSize.BIG_1,
      ),
    );
  }

  Widget _buildIndicator(List<dynamic> image) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: image.length,
      effect: ExpandingDotsEffect(
        dotWidth: 12,
        dotHeight: 5,
        activeDotColor: kPrimaryColorLight,
      ),
    );
  }

  Widget _buildInfoTitle(CategoryModel category) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              category.title,
              maxLines: 2,
              fontSize: FontSize.BIG_1,
            ),
          ),
          Consumer<CategoryProvider>(
            builder: (context, provider, _) => GestureDetector(
              onTap: () async {
                await provider.addCategoryToFavorite(category);
                CustomSnackBar.dialogMessenger(context,
                    'Thêm sản phẩm vào danh mục yêu thích thành công!');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimen.verticalSpacing_10,
                  horizontal: AppDimen.horizontalSpacing_5 + 1,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
                  color: kColorItemGrey.withOpacity(.4),
                ),
                child: Icon(
                  CupertinoIcons.bookmark,
                  size: AppDimen.icon_size + 2,
                  color: kTextColorGrey,
                ),
              ),
            ),
          ),
          // SizedBox(width: 5),
          // GestureDetector(
          //   onTap: () {},
          //   child: Icon(
          //     Icons.share,
          //     size: 35,
          //     color: kTextColorGrey,
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildInfoPrice(CategoryModel category, int priceDecreaseSale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        category.priceSale != 0
            ? CustomText(
                '${FormatPrice(category.price)} đ',
                fontSize: FontSize.SMALL + 1,
                decoration: TextDecoration.lineThrough,
                // style: TextStyle(decoration: ),
              )
            : SizedBox.shrink(),
        Row(
          children: [
            CustomText(
              '${FormatPrice(priceDecreaseSale)} đ',
              fontSize: FontSize.BIG_1,
              fontWeight: FontWeight.w700,
              color: category.priceSale != 0 ? kErrorColor : kTextDark,
            ),
            category.priceSale != 0
                ? SaleComponent(text: category.priceSale)
                : SizedBox.shrink(),
          ],
        ),
      ],
    );
  }

  Widget _buildVoteCategory(BuildContext context, String idCategory) {
    Map<String, dynamic> rateInfo =
        Provider.of<RateReviewProvider>(context, listen: false)
            .amountRates(idCategory);
    double amountStars = rateInfo['rating'];
    int amountViews = rateInfo['review'];
    return GestureDetector(
      onTap: () => amountViews == 0
          ? null
          : Navigator.of(context).pushNamed(
              RouteManage.rating_review,
              arguments: idCategory,
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: amountStars == 0 ? kTextColorGrey : kHighlightColor,
              size: 30,
            ),
            CustomText(
              '${amountStars}',
              fontSize: FontSize.BIG,
            ),
            SizedBox(width: 10),
            CustomText(
              amountViews == 0
                  ? 'Chưa có nhận xét nào'
                  : '(${amountViews} nhận xét)',
              fontSize: FontSize.BIG,
              color: kTextColorGrey,
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  'Xem tất cả',
                  color: kTextColorGrey,
                  fontSize: FontSize.SMALL,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppDimen.icon_size_small_1,
                  color: kTextColorGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(CategoryModel category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: AppDimen.spacing_1),
          child: _buildText(category.description),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isReadMore = !isReadMore;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: Platform.isIOS
                  ? AppDimen.verticalSpacing_16
                  : AppDimen.verticalSpacing_5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  isReadMore ? 'Thu gọn' : 'Xem thêm',
                  fontSize: FontSize.SMALL,
                  color: kTextColorGrey,
                ),
                Icon(
                  isReadMore
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: kTextColorGrey,
                  size: AppDimen.icon_size_small_1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText(String text) {
    final int platform = Platform.isIOS ? 5 : 4;
    final maxLines = isReadMore ? 100 : platform;
    final overflow = isReadMore ? TextOverflow.visible : TextOverflow.fade;
    return CustomText(
      text,
      fontSize: FontSize.BIG,
      color: Colors.grey.shade700,
      letterSpacing: .5,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  @override
  void initState() {
    super.initState();
    category = Provider.of<CategoryProvider>(context, listen: false)
        .findCategoryById(widget.idCategory!);

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int priceDecreaseSale = category.priceSale != 0
        ? (category.price * (100 - category.priceSale) ~/ 100)
        : category.price;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        color: kPrimaryColor,
        background: Colors.transparent,
        showCart: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              _buildImagesSlide(size, category),
              Positioned(
                bottom: 10,
                right: 20,
                child: _buildIndicator(category.imageUrl),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    _buildInfoTitle(category),
                    _buildInfoPrice(category, priceDecreaseSale),
                    _buildVoteCategory(context, category.id),
                    _buildDescription(category),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: widget.typeCategory == CategoryType.ANOTHER_CATEGORY
          ? ScrollToHideWidget(
              controller: _scrollController,
              child: BottomCategoryDetail(
                category: category,
                priceDecreaseSale: priceDecreaseSale == 0
                    ? priceDecreaseSale
                    : priceDecreaseSale,
                // quantity: quantityCategory,
              ),
            )
          : null,
    );
  }
}

class _buildImageSlide extends StatelessWidget {
  const _buildImageSlide({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image(
        image: NetworkImage(category.imageUrl[index]),
        fit: BoxFit.cover,
      ),
    );
  }
}
