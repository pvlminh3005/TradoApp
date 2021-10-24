import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/constants/sizes.dart';

class ChangeQuantity extends StatefulWidget {
  late int quantity;

  ChangeQuantity({
    this.quantity = 1,
    Key? key,
  }) : super(key: key);

  @override
  _ChangeQuantityState createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonCount(
          icon: Icons.remove,
          onPressed: () {
            setState(() {
              if (widget.quantity <= 1) return;
              widget.quantity--;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '${widget.quantity.toString().padLeft(2, "0")}',
            style: kTextMediumDark_18,
          ),
        ),
        ButtonCount(
          icon: Icons.add,
          onPressed: () => setState(() {
            widget.quantity++;
          }),
        ),
      ],
    );
  }
}

class ButtonCount extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  ButtonCount({
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kColorItemGrey,
        ),
        child: Icon(icon),
      ),
    );
  }
}
