import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/cart_provider.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/constants/sizes.dart';

import '/constants/constants.dart';

enum ChangeQuantityType { detailCategory, cartCategory }

class ChangeQuantity extends StatefulWidget {
  final String? idCategory;
  late int quantity;
  final ChangeQuantityType type;

  ChangeQuantity({
    this.idCategory = '',
    this.quantity = 1,
    this.type = ChangeQuantityType.detailCategory,
    Key? key,
  }) : super(key: key);

  @override
  _ChangeQuantityState createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    return Row(
      children: [
        ButtonCount(
          icon: Icons.remove,
          onPressed: () {
            switch (widget.type) {
              case ChangeQuantityType.cartCategory:
                setState(() {
                  widget.quantity--;
                });
                break;
              default:
                cartProvider.changeQuantityCategory(
                  widget.idCategory!,
                  CartQuantityType.decrease,
                );
                break;
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomText(
            '${widget.quantity.toString().padLeft(2, "0")}',
            fontSize: FontSize.BIG,
          ),
        ),
        ButtonCount(
          icon: Icons.add,
          onPressed: () {
            switch (widget.type) {
              case ChangeQuantityType.detailCategory:
                setState(() {
                  widget.quantity++;
                });
                break;
              default:
                cartProvider.changeQuantityCategory(
                  widget.idCategory!,
                  CartQuantityType.increase,
                );
                break;
            }
          },
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(AppDimen.spacing_1 - 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimen.radiusNormal + 2),
          color: kColorItemGrey,
        ),
        child: Icon(icon),
      ),
    );
  }
}
