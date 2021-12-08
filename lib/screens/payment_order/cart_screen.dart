import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/payment_order/checkout_screen.dart';
import '/utils/input_formatter.dart';
import '/components/custom_icon.dart';
import '/components/config_price.dart';
import '/components/primary_button.dart';
import '/components/custom_text.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';

import '../../models/cart_model.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late TextEditingController voucherController;
  late double totalPrice;

  @override
  void initState() {
    super.initState();

    voucherController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    Provider.of<CartProvider>(context, listen: false).reloadCheckCart();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    voucherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBarWidget(
        color: kPrimaryColor,
        title: 'Giỏ hàng',
      ),
      body: _buildBody(provider.listCart),
    );
  }

  Widget _buildBody(Map<String, CartModel> listCart) {
    return Column(
      children: [
        Expanded(
          child: listCart.isNotEmpty
              ? ListView.builder(
                  itemCount: listCart.length,
                  itemBuilder: (BuildContext context, int index) {
                    CartModel cart = listCart.values.toList()[index];
                    return CartItem(cart);
                  },
                )
              : Center(
                  child: CustomText(
                    'Giỏ hàng trống',
                    fontSize: FontSize.BIG - 1,
                    color: kTextColorGrey,
                  ),
                ),
        ),
        listCart.isNotEmpty ? _buildFooter() : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
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
              _buildButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVoucher() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: voucherController,
          style: TextStyle(
            fontSize: FontSize.SMALL,
            color: kTextColorGrey,
            fontWeight: FontWeight.w700,
          ),
          inputFormatters: [UpperCaseTextFormatter()],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: AppDimen.verticalSpacing_16,
              horizontal: AppDimen.horizontalSpacing_10,
            ),
            hintText: 'Nhập mã giảm giá',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
              borderSide: BorderSide(color: kPrimaryColor),
            ),
          ),
        ),
        Container(
          width: 51.0,
          height: 51.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimen.radiusNormal + 2,
            ),
            color: kPrimaryColor,
          ),
          child: CustomIcon(
            CupertinoIcons.chevron_right,
            color: kCardColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTotal() {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Flexible(
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
        );
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Flexible(
          flex: 2,
          child: PrimaryButton(
            title: 'Tiếp tục',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckOutScreen(
                  totalPrice: provider.totalAmount,
                  quantity: provider.listCheckCart.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//FIX colors