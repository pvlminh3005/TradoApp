import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import '/components/custom_text.dart';

import '/constants/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color? background;
  final Color? color;
  final String? title;
  final Widget? childAction;
  final bool? showLeading;
  final PreferredSize? bottom;

  AppBarWidget({
    this.background = Colors.transparent,
    this.color = kPrimaryColor,
    this.title = '',
    this.showLeading = true,
    this.childAction = const SizedBox.shrink(),
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
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                CupertinoIcons.back,
                size: AppDimen.icon_size_small,
                color: color,
              ))
          : SizedBox.shrink(),
      actions: [
        childAction!,
      ],
      bottom: bottom ??
          PreferredSize(
            preferredSize: Size.zero,
            child: Container(),
          ),
    );
  }
}
