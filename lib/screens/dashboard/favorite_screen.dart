import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_text.dart';
import '/components/custom_refresh_page.dart';
import '/components/custom_search_bar.dart';
import '/models/category_model.dart';
import '/providers/category_provider.dart';
import '/constants/dimen.dart';
import '/widgets/category_order_item.dart';
import '/components/custom_icon.dart';
import '/constants/constants.dart';
import '/widgets/appbar_widget.dart';

List<String> data = [
  'Macbook Pro 14 inch',
  'Apple Watch s6',
  'TV Sony',
];

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  List<String> dataSearch = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // _favoriteFuture = Provider.of<CategoryProvider>(context, listen: false)
    //     .fetchAllFavoriteCategories();
    setState(() {
      dataSearch = data.map((e) => e.toLowerCase()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Sản phẩm yêu thích',
        leading: IconButton(
          icon: CustomIcon(
            CupertinoIcons.search,
            color: kPrimaryColor,
          ),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearch(
                data: Provider.of<CategoryProvider>(context, listen: false)
                    .listFavoriteCategories,
              ),
            );
          },
        ),
      ),
      //   body: FutureBuilder(
      //     future: _favoriteFuture,
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return LoadingPage();
      //       } else {
      //         if (snapshot.hasError) {
      //           return Center(
      //             child: CustomText('Có lỗi xảy ra!'),
      //           );
      //         } else {
      //           return Padding(
      //             padding: const EdgeInsets.all(AppDimen.spacing_1 + 2),
      //             child: Consumer<CategoryProvider>(
      //               builder: (ctx, provider, _) => ListView.builder(
      //                 itemCount: provider.listFavoriteCategories.length,
      //                 itemBuilder: (context, index) {
      //                   CategoryModel category =
      //                       provider.listFavoriteCategories[index];
      //                   return CategoryOrderItem(
      //                     showMore: true,
      //                     cagetogry: category,
      //                   );
      //                 },
      //               ),
      //             ),
      //           );
      //         }
      //       }
      //     },
      //   ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimen.spacing_1 + 2),
        child: Consumer<CategoryProvider>(
          builder: (ctx, provider, _) {
            return CustomRefreshPage(
              onRefresh: () async {
                await provider.fetchAllFavoriteCategories();
              },
              child: ListView.builder(
                itemCount: provider.listFavoriteCategories.length,
                itemBuilder: (context, index) {
                  CategoryModel category =
                      provider.listFavoriteCategories[index];
                  return CategoryOrderItem(
                    showMore: true,
                    category: category,
                    showQuantity: false,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
