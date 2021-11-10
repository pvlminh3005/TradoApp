import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/cart_provider.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/constants/sizes.dart';

import '/constants/constants.dart';

class ChangeQuantity extends StatelessWidget {
  final String? idCategory;

  ChangeQuantity({
    this.idCategory = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    var category = cartProvider.listCart[idCategory];
    int quantity = category!.quantity;
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) => Row(
        children: [
          ButtonCount(
            icon: Icons.remove,
            onPressed: () {
              if (quantity < 2) return;

              cartProvider.changeQuantityCategory(
                idCategory: idCategory!,
                quantity: --quantity,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimen.spacing_1),
            child: CustomText(
              '${quantity.toString().padLeft(2, "0")}',
              fontSize: FontSize.BIG,
            ),
          ),
          ButtonCount(
            icon: Icons.add,
            onPressed: () {
              cartProvider.changeQuantityCategory(
                idCategory: idCategory!,
                quantity: ++quantity,
              );
            },
          ),
        ],
      ),
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
