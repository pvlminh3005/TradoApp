import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/constants.dart';

import '/constants/sizes.dart';
import '/providers/cart_provider.dart';
import '/components/config_price.dart';
import '/widgets/change_quantity.dart';
import '../models/cart_model.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;

  CartItem(this.cart);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Dismissible(
        key: Key(cart.id),
        onDismissed: (direction) => provider.removeToCart(cart.id),
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
                  size: 30,
                  color: kErrorColor.withOpacity(.8),
                ),
              ],
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                cart.imageUrl,
                width: size.width * .25,
                height: size.width * .3,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: size.width * .3,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.title,
                      style: kTextBoldDark_20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('${FormatPrice(cart.price)} đ',
                        style: kTextBoldError_18),
                    ChangeQuantity(quantity: cart.quantity),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
