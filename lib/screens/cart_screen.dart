import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    Map<String, CartModel> listCart = provider.listCart;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBarWidget(
        color: theme.primaryColor,
        title: 'Giỏ hàng',
      ),
      body: ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (BuildContext context, int index) {
          CartModel cart = listCart.values.toList()[index];
          return CartItem(cart);
        },
      ),
    );
  }
}
