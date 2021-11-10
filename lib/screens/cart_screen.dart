import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/config_price.dart';
import 'package:trado_app_uit/components/primary_button.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';

import '../models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    provider.reloadCheckCart();
    Map<String, CartModel> listCart = provider.listCart;
    return Scaffold(
      appBar: AppBarWidget(
        color: kPrimaryColor,
        title: 'Giỏ hàng',
      ),
      body: _buildBody(listCart),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimen.verticalSpacing_16,
          horizontal: AppDimen.spacing_3,
        ),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimen.radiusBig_2),
            topRight: Radius.circular(AppDimen.radiusBig_2),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildVoucher(),
            const SizedBox(height: AppDimen.verticalSpacing_16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTotal(),
                _buildButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(Map<String, CartModel> listCart) {
    return ListView.builder(
      itemCount: listCart.length,
      itemBuilder: (BuildContext context, int index) {
        CartModel cart = listCart.values.toList()[index];
        return CartItem(cart);
      },
    );
  }

  Widget _buildVoucher() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimen.spacing_1),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.receipt,
            color: kPrimaryColor,
            size: AppDimen.icon_size_big,
          ),
        ),
        const Spacer(),
        CustomText(
          'Nhập mã giảm giá',
          fontSize: FontSize.SMALL,
          color: kTextColorGrey,
        ),
        const SizedBox(width: 6),
        Icon(
          Icons.arrow_forward_ios,
          size: AppDimen.icon_size_small,
          color: kTextColorGrey,
        ),
      ],
    );
  }

  Widget _buildTotal() {
    return Consumer<CartProvider>(
      builder: (context, provider, _) => Flexible(
        flex: 1,
        child: Text.rich(
          TextSpan(
            text: 'Tổng cộng: \n',
            style: TextStyle(
              color: kTextColorGrey,
              fontSize: FontSize.MEDIUM,
            ),
            children: [
              TextSpan(
                text: '${FormatPrice(provider.totalAmount)} đ',
                style: TextStyle(
                  color: kTextDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Flexible(
      flex: 2,
      child: PrimaryButton(
        title: 'Tiếp tục',
        onPressed: () {
          print('Tiep tuc');
        },
      ),
    );
  }
}

//FIX colors