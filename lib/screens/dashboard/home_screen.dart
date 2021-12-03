import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/extensions/custom_extension.dart';
import '/components/custom_icon.dart';
import '/components/data_search.dart';
import '/constants/constants.dart';
import '/providers/category_provider.dart';
import '/widgets/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<CategoryProvider>(context, listen: false).fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(
          icon: CustomIcon(
            CupertinoIcons.search,
            color: kPrimaryColor,
          ),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
        showCart: true,
      ),
      body: Consumer<CategoryProvider>(builder: (ctx, provider, _) {
        return SizedBox().gridCategory(provider.listCategories);
      }),
    );
  }
}
