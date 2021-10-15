import 'package:flutter/material.dart';

class SaleComponent extends StatelessWidget {
  final int text;
  final TextStyle? textStyle;

  const SaleComponent({
    required this.text,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: .7,
          color: theme.errorColor,
        ),
        color: theme.dialogBackgroundColor,
      ),
      child: Text(
        '- ${text.toStringAsFixed(0)}%',
        style: textStyle?.merge(
          TextStyle(
            color: theme.errorColor,
          ),
        ),
      ),
    );
  }
}
