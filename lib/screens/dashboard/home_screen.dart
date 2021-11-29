import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_icon.dart';
import '/components/data_search.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/models/category_model.dart';
import '/providers/cart_provider.dart';
import '/providers/category_provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/bage.dart';
import '/widgets/category_item.dart';
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
    // List<CategoryModel> _listCategories =
    //     Provider.of<CategoryProvider>(context, listen: false).listCategories;
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
      body: Consumer<CategoryProvider>(
        builder: (ctx, provider, _) => GridView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimen.verticalSpacing_10,
            horizontal: 5,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemCount: provider.listCategories.length,
          itemBuilder: (BuildContext context, int index) {
            CategoryModel category = provider.listCategories[index];
            return CategoryItem(category: category);
          },
        ),
      ),
    );
  }
}
