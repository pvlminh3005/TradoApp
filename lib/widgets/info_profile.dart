import 'package:flutter/material.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';
import '/models/info_card_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

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
              InfoCard(),
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
      child: Text(
        title,
        style: kTextMediumGrey_14,
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        size: 22,
                        color: info.isChecked ? kTextLight : Color(0xFF888888),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      info.title,
                      style: kTextMediumDark_12.merge(
                        TextStyle(
                          color: info.isChecked ? kTextDark : Color(0xFF888888),
                        ),
                      ),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Text(
        description,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        style: kTextMediumDark_14,
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
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$count',
              style: kTextMediumDark_24,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: kTextMediumDark_14,
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
        SizedBox(width: 20),
        _buildTransactionItem('Mặt hàng đã mua', countCategoriesBuy),
      ],
    );
  }
}
