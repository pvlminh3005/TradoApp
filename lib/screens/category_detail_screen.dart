import 'dart:io';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/sale_component.dart';
import 'package:trado_app_uit/models/rate_category_model.dart';
import 'package:trado_app_uit/providers/rate_review_provider.dart';
import '/screens/rating_and_review_screen.dart';

import '/providers/cart_provider.dart';
import '/widgets/bage.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/scroll_hide_widget.dart';
import '../widgets/bottom_category_detail.dart';
import '../models/category_model.dart';
import '../providers/category_provider.dart';
import 'cart_screen.dart';

class CategoryDetailScreen extends StatefulWidget {
  static String routeName = '/category_detail';

  CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int activeIndex = 0; //page indicator image
  int quantityCategory = 1;
  bool isReadMore = false;
  bool isFavorited = false;
  late ScrollController _scrollController;

  Widget _buildImagesSlide(Size size, ThemeData theme, CategoryModel category) {
    return Hero(
      transitionOnUserGestures: true,
      tag: '${category.id}',
      child: Container(
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
    );
  }

  Widget _buildIndicator(ThemeData theme, List<String> image) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: image.length,
      effect: ExpandingDotsEffect(
        dotWidth: 12,
        dotHeight: 5,
        activeDotColor: theme.primaryColor,
      ),
    );
  }

  Widget _buildInfoTitle(ThemeData theme, CategoryModel category) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              category.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.caption?.merge(
                TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorited = !isFavorited;
              });
            },
            child: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border_outlined,
              size: 35,
              color: isFavorited ? theme.errorColor : theme.textSelectionColor,
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.share,
              size: 35,
              color: theme.textSelectionColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoPrice(
      ThemeData theme, CategoryModel category, double priceDecreaseSale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        category.priceSale != 0
            ? Text(
                '${NumberFormat.currency(
                  locale: 'id',
                  decimalDigits: 0,
                  symbol: '',
                ).format(category.price)} đ',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              )
            : SizedBox.shrink(),
        Row(
          children: [
            Text(
              '${NumberFormat.currency(
                locale: 'id',
                decimalDigits: 0,
                symbol: '',
              ).format(priceDecreaseSale)} đ',
              style: theme.textTheme.caption?.merge(
                TextStyle(
                  color: category.priceSale != 0 ? theme.errorColor : null,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            category.priceSale != 0
                ? SaleComponent(
                    text: category.priceSale,
                    textStyle: theme.textTheme.button?.merge(
                      TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                : SizedBox.shrink(),
            Spacer(),
            Row(
              children: [
                ButtonCount(
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      if (quantityCategory <= 1) return;
                      quantityCategory--;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '${quantityCategory.toString().padLeft(2, "0")}',
                    style: theme.textTheme.button?.merge(
                      TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                ButtonCount(
                  icon: Icons.add,
                  onPressed: () => setState(() {
                    quantityCategory++;
                  }),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVoteCategory(
      BuildContext context, ThemeData theme, String idCategory) {
    Map<String, dynamic> rateInfo =
        Provider.of<RateReviewProvider>(context, listen: false)
            .amountRates(idCategory);
    double amountStars = rateInfo['rating'];
    int amountViews = rateInfo['review'];
    return GestureDetector(
      onTap: () => amountViews == 0
          ? null
          : Navigator.of(context).pushNamed(RatingAndReviewScreen.routeName,
              arguments: idCategory),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: amountStars == 0
                  ? theme.textSelectionColor
                  : theme.highlightColor,
              size: 30,
            ),
            Text(
              '${amountStars}',
              style: theme.textTheme.headline3,
            ),
            SizedBox(width: 10),
            Text(
              amountViews == 0
                  ? 'Chưa có nhận xét nào'
                  : '(${amountViews} nhận xét)',
              style: theme.textTheme.headline3?.merge(
                TextStyle(
                  color: theme.textSelectionColor,
                ),
              ),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Xem tất cả',
                  style: theme.textTheme.headline2?.merge(
                    TextStyle(
                      color: theme.textSelectionColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: theme.textSelectionColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(ThemeData theme, CategoryModel category) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: _buildText(theme, category.description),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isReadMore = !isReadMore;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: Platform.isIOS ? 15 : 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isReadMore ? 'Thu gọn' : 'Xem thêm',
                  style: theme.textTheme.headline2
                      ?.merge(TextStyle(color: theme.textSelectionColor)),
                ),
                Icon(
                  isReadMore
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: theme.textSelectionColor,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText(ThemeData theme, String text) {
    final int platform = Platform.isIOS ? 6 : 5;
    final maxLines = isReadMore ? null : platform;
    final overflow = isReadMore ? TextOverflow.visible : TextOverflow.fade;
    return Text(
      text,
      style: theme.textTheme.headline3?.merge(
        TextStyle(
          color: Colors.grey.shade700,
          letterSpacing: .5,
        ),
      ),
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String idCategory = ModalRoute.of(context)?.settings.arguments as String;
    CategoryModel category =
        Provider.of<CategoryProvider>(context, listen: false)
            .findCategoryById(idCategory);
    double priceDecreaseSale = category.priceSale != 0
        ? (category.price * (100 - category.priceSale) / 100)
        : category.price;

    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        color: Colors.white,
        childAction: Consumer<CartProvider>(
          builder: (ctx, cartData, ch) => Badge(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
            value: cartData.cartCount.toString(),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              _buildImagesSlide(size, theme, category),
              Positioned(
                bottom: 10,
                right: 20,
                child: _buildIndicator(theme, category.imageUrl),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    _buildInfoTitle(theme, category),
                    _buildInfoPrice(theme, category, priceDecreaseSale),
                    _buildVoteCategory(context, theme, category.id),
                    _buildDescription(theme, category),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: ScrollToHideWidget(
        controller: _scrollController,
        child: BottomCategoryDetail(
          category: category,
          quantity: quantityCategory,
        ),
      ),
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

class ButtonCount extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  ButtonCount({
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme.accentColor,
        ),
        child: Icon(icon),
      ),
    );
  }
}
