import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import '../widgets/scroll_hide_widget.dart';
import '../widgets/bottom_category_detail.dart';
import '../models/category_model.dart';
import '../providers/category_provider.dart';

class CategoryDetailScreen extends StatefulWidget {
  static String routeName = '/category_detail';

  CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int activeIndex = 0; //page indicator image
  int countCategory = 1;
  bool isFavorited = false;
  late ScrollController _scrollController;

  Widget _buildIndicator(ThemeData theme, List<String> image) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: image.length,
      effect: ExpandingDotsEffect(
        dotWidth: 15,
        dotHeight: 7,
        activeDotColor: theme.primaryColor,
      ),
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

    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * .5,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
              // Positioned(
              //   top: 30,
              //   child: Row(
              //     children: [
              //       IconButton(
              //         onPressed: () {
              //           Navigator.of(context).pop();
              //         },
              //         icon: Icon(
              //           Icons.arrow_back_ios,
              //           size: 25,
              //           // color: theme.primaryColor,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category.title,
                            style: theme.textTheme.caption?.merge(
                              TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorited = !isFavorited;
                              });
                            },
                            child: Icon(
                              isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 35,
                              color: isFavorited
                                  ? theme.errorColor
                                  : theme.textSelectionColor,
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
                    ),
                    SizedBox(height: size.width * .03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${NumberFormat.currency(
                            locale: 'id',
                            decimalDigits: 0,
                            symbol: '',
                          ).format(category.price)} đ',
                          style: theme.textTheme.caption?.merge(
                            TextStyle(
                              fontFamily: 'RobotoCondensed',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            ButtonCount(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (countCategory <= 0) return;
                                  countCategory--;
                                });
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                  '${countCategory.toString().padLeft(2, "0")}',
                                  style: theme.textTheme.button),
                            ),
                            ButtonCount(
                              icon: Icons.add,
                              onPressed: () => setState(() {
                                countCategory++;
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print('CLICK');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: category.amountVoteStars == 0
                                      ? Color(0xFF777777)
                                      : theme.highlightColor,
                                  size: 35,
                                ),
                                Text(
                                  '${category.amountVoteStars}',
                                  style: theme.textTheme.headline3,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  category.amoutComment == 0
                                      ? 'Chưa có nhận xét nào'
                                      : '(${category.amoutComment} nhận xét)',
                                  style: theme.textTheme.headline3?.merge(
                                    TextStyle(
                                      color: theme.textSelectionColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                    ),
                    Text(
                      category.description,
                      style: theme.textTheme.headline3?.merge(
                        TextStyle(
                          color: Colors.grey.shade700,
                          letterSpacing: .5,
                        ),
                      ),
                      overflow: TextOverflow.fade,
                      // maxLines: 7,
                    ),
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
        child: BottomCategoryDetail(),
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
    return Hero(
      transitionOnUserGestures: true,
      tag: category.imageUrl[index],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: NetworkImage(category.imageUrl[index]),
          fit: BoxFit.cover,
        ),
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: theme.accentColor,
        ),
        child: Icon(icon),
      ),
    );
  }
}
