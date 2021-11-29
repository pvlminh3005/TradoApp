import 'package:flutter/material.dart';
import '/components/card_shadow.dart';
import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/constants/sizes.dart';
import '../../screens/shipping_address/add_shipping_address_screen.dart';

class AddressDetailWidget extends StatelessWidget {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final String? note;

  const AddressDetailWidget({
    this.id,
    this.name,
    this.phoneNumber,
    this.address,
    this.note,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_10),
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildDetailInfo(),
          note!.isNotEmpty
              ? Column(
                  children: [
                    const Divider(
                      height: 0,
                      thickness: 1,
                      color: kColorItemGrey,
                    ),
                    _buildNote(),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildHeader(var context) {
    return Container(
      padding: const EdgeInsets.all(AppDimen.verticalSpacing_16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kColorItemGrey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            name!,
            fontSize: FontSize.BIG - 1,
            fontWeight: FontWeight.w700,
            maxLines: 1,
          ),
          _buildButtonIcon(context),
        ],
      ),
    );
  }

  Widget _buildButtonIcon(BuildContext context) {
    void onTap() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => AddShippingAddressScreen(
            id: id!,
            name: name!,
            phone: phoneNumber!,
            address: address!,
            note: note!,
            isEditAddress: true,
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Image.asset('assets/images/edit-2.png'),
    );
  }

  Widget _buildDetailInfo() {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.spacing_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextInfo(phoneNumber),
          const SizedBox(height: 5.0),
          _buildTextInfo(address),
        ],
      ),
    );
  }

  Widget _buildNote() {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.verticalSpacing_16),
      child: Row(
        children: [
          CustomText(
            'Ghi chú:',
            fontSize: FontSize.SMALL + 1,
            fontWeight: FontWeight.bold,
            color: kErrorColor.withOpacity(.7),
          ),
          const SizedBox(width: 5.0),
          _buildTextInfo(note!),
        ],
      ),
    );
  }

  Widget _buildTextInfo(String? text) {
    return CustomText(
      text!,
      fontSize: FontSize.SMALL + 1,
      color: kTextColorGrey,
    );
  }
}
