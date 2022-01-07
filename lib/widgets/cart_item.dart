import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import 'package:trado_app_uit/models/category_model.dart';
import 'package:trado_app_uit/screens/category/category_detail_screen.dart';
import '/providers/category_provider.dart';
import '/components/custom_icon.dart';
import '/constants/sizes.dart';
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

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryDetailScreen(
              idCategory: widget.cart.category!.id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimen.horizontalSpacing_10,
          vertical: AppDimen.verticalSpacing_5,
        ),
        child: Dismissible(
          key: Key(widget.cart.id!),
          onDismissed: (direction) => provider.removeToCart(widget.cart.id!),
          background: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(AppDimen.radiusBig),
            ),
            child: Row(
              children: [
                Spacer(),
                Icon(
                  CupertinoIcons.delete_solid,
                  size: AppDimen.icon_size_big,
                  color: kErrorColor.withOpacity(.7),
                ),
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppDimen.spacing_1),
            decoration: BoxDecoration(
              color: kBackgroundColorWhite,
              borderRadius: BorderRadius.circular(AppDimen.radiusBig),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
                  child: Image.network(
                    widget.cart.category!.imageUrl[0],
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
                          widget.cart.category!.title,
                          fontWeight: FontWeight.w700,
                          fontSize: FontSize.BIG,
                          maxLines: 1,
                        ),
                        CustomText(
                          '${FormatPrice(widget.cart.category!.price)} đ',
                          fontSize: FontSize.BIG,
                          fontWeight: FontWeight.w700,
                          color: kErrorColor,
                        ),
                        ChangeQuantity(idCategory: widget.cart.id),
                      ],
                    ),
                  ),
                ),
                _buildCheckbox(provider),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(CartProvider cartProvider) {
    return Consumer<CategoryProvider>(
      builder: (ctx, categoryProvider, _) => InkWell(
        onTap: () {
          var infoCategory = categoryProvider.listCategories.firstWhere(
            (category) => category.id == widget.cart.id,
          );
          if (infoCategory.status == false) return;

          setState(() {
            isChecked = !isChecked;
          });
          print("121: " + infoCategory.id);
          if (isChecked == true) {
            cartProvider.addToCheckCart(infoCategory.id);
          } else
            cartProvider.removeCheckCart(infoCategory.id);
        },
        child: CustomIcon(
          isChecked
              ? CupertinoIcons.check_mark_circled_solid
              : CupertinoIcons.checkmark_alt_circle,
          size: AppDimen.icon_size_big,
          color: isChecked ? kPrimaryColor : kColorItemGrey,
        ),
      ),
    );
  }
}
