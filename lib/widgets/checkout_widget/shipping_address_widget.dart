import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/card_shadow.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';

class ShippingAddressWidget extends StatelessWidget {
  final String? name;
  final String? phoneNumber;
  final String? address;

  const ShippingAddressWidget({
    this.name = 'Le Minh Pham',
    this.phoneNumber = '(+84) 123456789',
    this.address = 'Nha xx, Duong xx, Quan XX, Tp XXX, Tỉnh XX',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_16),
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildDetailInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
            fontSize: FontSize.BIG,
            fontWeight: FontWeight.w700,
            maxLines: 1,
          ),
          _buildButtonIcon(),
        ],
      ),
    );
  }

  Widget _buildButtonIcon() {
    return InkWell(
      onTap: () {},
      child: Image.asset('assets/images/edit-2.png'),
    );
  }

  Widget _buildDetailInfo() {
    return Padding(
      padding: const EdgeInsets.all(AppDimen.verticalSpacing_16),
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

  Widget _buildTextInfo(String? text) {
    return CustomText(
      text!,
      fontSize: FontSize.SMALL,
      color: kTextColorGrey,
    );
  }
}
