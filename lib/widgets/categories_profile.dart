import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_refresh_page.dart';
import 'package:trado_app_uit/components/loading/loading_app.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/extensions/custom_extension.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';

import '/constants/constants.dart';
import '/providers/category_provider.dart';
import '../models/category_model.dart';
import './category_item.dart';

class CategoriesWidget extends StatefulWidget {
  final String? idUser;

  const CategoriesWidget({
    this.idUser,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    var data = await Provider.of<CategoryProvider>(context, listen: false)
        .fetchCategoriesById(widget.idUser!);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomRefreshPage(
        onRefresh: () async {},
        child: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              LoadingApp.LOADWAITING(title: 'Đang tải sản phẩm');
              return SizedBox();
            }

            LoadingApp.DISMISS();
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox().gridCategory(snapshot.data);
            } else {
              return Center(
                child: Text('Không có sản phẩm nào'),
              );
            }
          },
        ),
      ),
      // body: Container(
      //   height: 300,
      //   child: CategoryItem(
      //     category: listCategories[1],
      //   ),
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
