import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/routes/routes_manage.dart';

import '/constants/sizes.dart';
import '/constants/constants.dart';
import '../models/category_model.dart';
import '../providers/cart_provider.dart';

class BottomCategoryDetail extends StatelessWidget {
  final CategoryModel category;
  final int quantity;
  final double priceDecreaseSale;

  BottomCategoryDetail({
    required this.category,
    this.quantity = 1,
    required this.priceDecreaseSale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final providerCart = Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FormIcon(
            icon: Icons.store_mall_directory,
            onPressed: () {
              Navigator.of(context).pushNamed(RouteManage.diff_profile);
            },
          ),
          SizedBox(width: size.width * .03),
          FormIcon(
            icon: Icons.add_shopping_cart_rounded,
            color: kHighlightColor,
            onPressed: () {
              providerCart.addToCart(
                category.id,
                category.title,
                category.imageUrl[0],
                priceDecreaseSale,
                quantity,
              );
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text('Add to cart!'),
              //     duration: Duration(seconds: 1),
              //     action: SnackBarAction(
              //       label: 'UNDO',
              //       onPressed: () {
              //         providerCart.removeSingleCategory(category.id);
              //       },
              //     ),
              //   ),
              // );
            },
          ),
          SizedBox(width: size.width * .04),
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: kPrimaryColor,
              child: Text(
                'Mua ngay',
                style: kTextBoldLight_18,
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
  final Color color;
  final Function() onPressed;

  FormIcon({
    required this.icon,
    required this.onPressed,
    this.color = const Color(0xFF666666),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: kColorItemGrey.withOpacity(.6),
          child: Icon(
            icon,
            size: 27,
            color: color,
          ),
        ),
      ),
    );
  }
}
