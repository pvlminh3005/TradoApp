import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildDivider(theme.primaryColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Hoặc đăng nhập với',
              style: theme.textTheme.headline1?.merge(
                TextStyle(color: theme.primaryColor),
              ),
            ),
          ),
          _buildDivider(theme.primaryColor),
        ],
      ),
    );
  }
}

Expanded _buildDivider(Color color) {
  return Expanded(
    child: Divider(
      color: color,
      height: 1.5,
      thickness: 1.5,
    ),
  );
}
