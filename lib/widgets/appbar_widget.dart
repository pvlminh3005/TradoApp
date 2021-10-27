import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/constants/sizes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color background;
  final Color color;
  final String title;
  final Widget childAction;
  final bool showLeading;

  AppBarWidget({
    this.background = Colors.transparent,
    this.color = kPrimaryColor,
    this.title = '',
    this.showLeading = true,
    this.childAction = const SizedBox.shrink(),
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: kTextBoldDark_20,
      ),
      backgroundColor: background,
      leading: showLeading
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: color,
              ))
          : SizedBox.shrink(),
      actions: [
        childAction,
      ],
    );
  }
}
