import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  const GridButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(
            onPressed: () {},
            title: 'Quan tâm',
            background: theme.primaryColor,
            textColor: Colors.white,
          ),
          SizedBox(width: 15),
          Button(
            onPressed: () {},
            title: 'Báo cáo',
            background: theme.backgroundColor,
            textColor: Colors.black,
          ),
        ],
        // gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   childAspectRatio: 3 / 2,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 15,
        // ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color background;
  final Color textColor;

  const Button({
    required this.title,
    required this.onPressed,
    required this.textColor,
    required this.background,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Expanded(
      child: RaisedButton(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: background,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        elevation: 0,
        onPressed: onPressed,
        child: Text(
          title,
          style: theme.textTheme.bodyText1?.merge(
            TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
