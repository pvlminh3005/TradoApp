import 'package:flutter/material.dart';

class BottomCategoryDetail extends StatelessWidget {
  const BottomCategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FormIcon(
            icon: Icons.store_mall_directory,
            onPressed: () {},
          ),
          SizedBox(width: 10),
          FormIcon(
            icon: Icons.chat_rounded,
            onPressed: () {},
          ),
          SizedBox(width: 15),
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: theme.primaryColor,
              child: Text(
                'Thêm vào giỏ hàng',
                style: theme.textTheme.headline1?.merge(TextStyle(
                  color: Colors.white,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormIcon extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  FormIcon({
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: theme.accentColor.withOpacity(.9),
          child: Icon(
            icon,
            size: 30,
            color: Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}
