import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/screens/diff_profile_screen.dart';
import '../models/category_model.dart';
import '../providers/cart_provider.dart';

class BottomCategoryDetail extends StatelessWidget {
  final CategoryModel category;
  final int quantity;

  const BottomCategoryDetail({
    required this.category,
    this.quantity = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final providerCart = Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FormIcon(
            icon: Icons.store_mall_directory,
            onPressed: () {
              Navigator.of(context).pushNamed(DiffProfileScreen.routeName);
            },
          ),
          SizedBox(width: size.width * .03),
          FormIcon(
            icon: Icons.add_shopping_cart_rounded,
            color: theme.highlightColor,
            onPressed: () {
              providerCart.addToCart(
                category.id,
                category.title,
                category.imageUrl[0],
                category.price,
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
              color: theme.primaryColor,
              child: Text(
                'Mua ngay',
                style: theme.textTheme.headline1?.merge(TextStyle(
                  color: Colors.white,
                )),
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
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: theme.accentColor.withOpacity(.6),
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
