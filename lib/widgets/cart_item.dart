import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/custom_icon.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import '/constants/dimen.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';

import '/providers/cart_provider.dart';
import '/components/config_price.dart';
import '/widgets/change_quantity.dart';
import '../models/cart_model.dart';

class CartItem extends StatefulWidget {
  final CartModel cart;

  CartItem(this.cart);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Dismissible(
        key: Key(widget.cart.id),
        onDismissed: (direction) => provider.removeToCart(widget.cart.id),
        background: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Spacer(),
              Icon(
                Icons.delete,
                size: AppDimen.icon_size_big,
                color: kErrorColor.withOpacity(.8),
              ),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
              child: Image.network(
                widget.cart.imageUrl,
                width: size.width * .25,
                height: size.width * .25,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: size.width * .3,
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimen.verticalSpacing_10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      widget.cart.title,
                      fontWeight: FontWeight.w700,
                      fontSize: FontSize.BIG,
                      maxLines: 1,
                    ),
                    CustomText(
                      '${FormatPrice(widget.cart.price)} đ',
                      fontSize: FontSize.BIG,
                      fontWeight: FontWeight.w700,
                      color: kErrorColor,
                    ),
                    ChangeQuantity(
                      idCategory: widget.cart.id,
                      quantity: widget.cart.quantity,
                      type: ChangeQuantityType.cartCategory,
                    ),
                  ],
                ),
              ),
            ),
            _buildCheckbox(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return Consumer<CartProvider>(
      builder: (ctx, provider, _) {
        return InkWell(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
            if (isChecked == true) {
              provider.addToCheckCart(widget.cart.id, widget.cart);
            } else
              provider.removeCheckCart(widget.cart.id);
          },
          child: CustomIcon(
            icon: isChecked
                ? CupertinoIcons.check_mark_circled_solid
                : CupertinoIcons.checkmark_alt_circle,
            size: AppDimen.icon_size_big,
            color: isChecked ? kPrimaryColor : Color(0xFF909090),
          ),
        );
      },
    );
  }
}
