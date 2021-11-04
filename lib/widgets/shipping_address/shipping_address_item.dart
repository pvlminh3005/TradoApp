import 'package:flutter/material.dart';
import '/components/custom_text.dart';
import '/constants/sizes.dart';
import '/models/shipping_address_model.dart';
import '/widgets/checkout_widget/address_detail_widget.dart';

class ShippingAddressItem extends StatefulWidget {
  final ShippingAddressModel? shippingAddress;

  ShippingAddressItem({
    this.shippingAddress,
    Key? key,
  }) : super(key: key);

  @override
  State<ShippingAddressItem> createState() => _ShippingAddressItemState();
}

class _ShippingAddressItemState extends State<ShippingAddressItem> {
  bool defaultAddress = false;

  @override
  void initState() {
    super.initState();
    defaultAddress = widget.shippingAddress!.defaultAddress;
  }

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
    return InkWell(
      onTap: () {
        setState(() {
          defaultAddress = !defaultAddress;
        });
      },
      child: Row(
        children: [
          defaultAddress
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
  }

  Widget _buildInfo() {
    return AddressDetailWidget(
      name: widget.shippingAddress!.name,
      phoneNumber: widget.shippingAddress!.phoneNumber,
      address: widget.shippingAddress!.address,
      note: widget.shippingAddress!.note,
    );
  }
}
