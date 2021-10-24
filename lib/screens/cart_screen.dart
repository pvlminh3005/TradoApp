import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/constants/constants.dart';

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
    return Scaffold(
      appBar: AppBarWidget(
        color: kPrimaryColor,
        title: 'Giỏ hàng',
      ),
      body: ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (BuildContext context, int index) {
          CartModel cart = listCart.values.toList()[index];
          return CartItem(cart);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        height: 174,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(.15),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.receipt,
                    color: kPrimaryColor,
                    size: 35,
                  ),
                ),
                const Spacer(),
                Text('Mã giảm giá'),
                const SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios, size: 15, color: kTextColorGrey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//FIX colors