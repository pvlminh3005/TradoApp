import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;

  CartItem(this.cart);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          Row(
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
              SizedBox(width: 10),
              Container(
                height: size.width * .25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cart.title, style: theme.textTheme.headline3),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Số lượng: ',
                            style: theme.textTheme.bodyText2,
                          ),
                          TextSpan(
                            text: '${cart.quantity}',
                            style: theme.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
