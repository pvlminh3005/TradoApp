import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color background;
  final Color color;
  final String title;
  final Widget childAction;

  const AppBarWidget({
    this.background = Colors.transparent,
    this.color = const Color(0xFF3EBACE),
    this.title = '',
    this.childAction = const SizedBox.shrink(),
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: theme.textTheme.button,
      ),
      backgroundColor: background,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: color,
          )),
      actions: [
        childAction,
      ],
    );
  }
}
