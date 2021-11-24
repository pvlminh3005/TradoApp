import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/components/data_search.dart';
import 'package:trado_app_uit/models/category_model.dart';
import 'package:trado_app_uit/providers/category_provider.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';
import '/constants/dimen.dart';
import '/widgets/category_order_item.dart';
import '/components/custom_icon.dart';
import '/constants/constants.dart';
import '/widgets/appbar_widget.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Future _favoriteFuture;

  @override
  void initState() {
    super.initState();
    // _favoriteFuture = Provider.of<CategoryProvider>(context, listen: false)
    //     .fetchAllFavoriteCategories();
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
            showSearch(context: context, delegate: DataSearch());
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
          builder: (ctx, provider, _) => ListView.builder(
            itemCount: provider.listFavoriteCategories.length,
            itemBuilder: (context, index) {
              CategoryModel category = provider.listFavoriteCategories[index];
              return CategoryOrderItem(
                showMore: true,
                category: category,
              );
            },
          ),
        ),
      ),
    );
  }
}
