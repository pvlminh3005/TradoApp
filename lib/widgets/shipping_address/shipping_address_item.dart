import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/shipping_address_provider.dart';
import '/components/custom_text.dart';
import '/constants/sizes.dart';
import '/models/shipping_address_model.dart';
import '/widgets/checkout_widget/address_detail_widget.dart';

class ShippingAddressItem extends StatelessWidget {
  final ShippingAddressModel? shippingAddress;

  ShippingAddressItem({
    this.shippingAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        _buildInfo(),
      ],
    );
  }

  Widget _buildTitle() {
    return Consumer<ShippingAddressProvider>(
      builder: (ctx, provider, _) {
        return InkWell(
          onTap: () {
            provider.setDefaultAddress(shippingAddress!.id);
          },
          child: Row(
            children: [
              shippingAddress!.defaultAddress
                  ? Image.asset(
                      'assets/images/icon_checked.png',
                      width: 20.0,
                      height: 20.0,
                    )
                  : CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Colors.grey.shade300,
                    ),
              const SizedBox(width: 6.0),
              CustomText(
                'Đặt làm địa chỉ mặc định',
                fontSize: FontSize.MEDIUM - 1,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfo() {
    return AddressDetailWidget(
      id: shippingAddress!.id,
      name: shippingAddress!.name,
      phoneNumber: shippingAddress!.phoneNumber,
      address: shippingAddress!.address,
      note: shippingAddress!.note,
    );
  }
}
