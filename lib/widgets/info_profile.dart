import 'package:flutter/material.dart';

import 'package:trado_app_uit/constants/dimen.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import 'package:trado_app_uit/models/user_model.dart';

import '/components/custom_text.dart';
import '/constants/constants.dart';
import '/models/info_card_model.dart';

class InfoWidget extends StatelessWidget {
  final UserModel? profile;

  const InfoWidget({
    this.profile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 5,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTitle(title: 'Thông tin đã xác nhận'),
              InfoCard(
                idCard: profile!.idCard!.isNotEmpty ? true : false,
                phone: profile!.phoneNumber!.isNotEmpty ? true : false,
                address: profile!.address!.isNotEmpty ? true : false,
                email: profile!.email!.isNotEmpty ? true : false,
              ),
              BuildTitle(title: 'Mô tả chung'),
              Description(description: ''),
              BuildTitle(title: 'Thông tin giao dịch'),
              TransactionCategories(),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTitle extends StatelessWidget {
  final String title;
  const BuildTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CustomText(
        title,
        color: kTextColorGrey,
        fontSize: FontSize.SMALL,
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final bool? idCard;
  final bool? phone;
  final bool? address;
  final bool? email;

  const InfoCard({
    Key? key,
    this.idCard,
    this.phone,
    this.address,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<InfoModel> listInfo = [
      InfoModel(
        title: 'CMND',
        icon: Icons.perm_contact_cal_rounded,
        isChecked: idCard!,
        routeName: '',
      ),
      InfoModel(
        title: 'Điện thoại',
        icon: Icons.phone,
        isChecked: phone!,
        routeName: '',
      ),
      InfoModel(
        title: 'Địa chỉ',
        icon: Icons.pin_drop,
        isChecked: address!,
        routeName: '',
      ),
      InfoModel(
        title: 'Email',
        icon: Icons.email,
        isChecked: email!,
        routeName: '',
      ),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: listInfo
            .map(
              (info) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(info.routeName),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          info.isChecked ? kPrimaryColor : kBackgroundColor,
                      radius: MediaQuery.of(context).size.width * .06,
                      child: Icon(
                        info.icon,
                        size: AppDimen.icon_size_small,
                        color: info.isChecked ? kTextLight : Color(0xFF888888),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      info.title,
                      fontSize: FontSize.SMALL_1,
                      color: info.isChecked ? kTextDark : Color(0xFF888888),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String description;

  const Description({
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: CustomText(
        description,
        maxLines: 10,
        fontSize: FontSize.SMALL,
      ),
    );
  }
}

class TransactionCategories extends StatelessWidget {
  final int countCategoriesBuy;
  final int countCategoriesSell;

  const TransactionCategories({
    this.countCategoriesBuy = 10,
    this.countCategoriesSell = 4,
    Key? key,
  }) : super(key: key);

  Widget _buildTransactionItem(String title, int count) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppDimen.horizontalSpacing_16),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(AppDimen.radiusBig),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              '$count',
              fontSize: FontSize.BIG_1,
            ),
            const SizedBox(height: 10),
            CustomText(
              title,
              fontSize: FontSize.SMALL,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTransactionItem('Mặt hàng đã bán', countCategoriesSell),
        const SizedBox(width: 20),
        _buildTransactionItem('Mặt hàng đã mua', countCategoriesBuy),
      ],
    );
  }
}
