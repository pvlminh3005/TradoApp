import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_icon.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/providers/cart_provider.dart';
import '/routes/routes_manage.dart';
import '/components/custom_text.dart';

import '/constants/constants.dart';
import 'bage.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color? background;
  final Color? color;
  final String? title;
  final List<Widget>? childAction;
  final bool? showLeading;
  final bool showCart;
  final Widget? leading;
  final PreferredSize? bottom;

  AppBarWidget({
    this.background = kBackgroundColorWhite,
    this.color = kPrimaryColor,
    this.title = '',
    this.leading = null,
    this.showLeading = true,
    this.showCart = false,
    this.childAction = const [const SizedBox.shrink()],
    this.bottom,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: CustomText(
        title!,
        fontSize: FontSize.BIG,
        fontWeight: FontWeight.w700,
        // style: kTextBoldDark_20,
      ),
      backgroundColor: background,
      leading: showLeading!
          ? leading ??
              IconButton(
                onPressed: () => Navigator.of(context).pop(false),
                icon: CustomIcon(
                  CupertinoIcons.back,
                  size: AppDimen.icon_size_small,
                  color: color!,
                ),
              )
          : SizedBox.shrink(),
      actions: [
        Row(children: childAction!),
        showCart
            ? Consumer<CartProvider>(
                builder: (ctx, cartData, ch) => Badge(
                  child: IconButton(
                    icon: CustomIcon(
                      CupertinoIcons.cart_fill,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteManage.cart);
                    },
                  ),
                  value: cartData.cartCount.toString(),
                ),
              )
            : const SizedBox.shrink(),
      ],
      bottom: bottom ??
          PreferredSize(
            preferredSize: Size.zero,
            child: Container(),
          ),
    );
  }
}
