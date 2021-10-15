import 'package:flutter/material.dart';
import 'package:trado_app_uit/models/info_card_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
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
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: theme.textTheme.headline2?.merge(
          TextStyle(
            color: Color(0xFF555555),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
                      backgroundColor: info.isChecked
                          ? theme.primaryColor
                          : theme.backgroundColor,
                      radius: MediaQuery.of(context).size.width * .06,
                      child: Icon(
                        info.icon,
                        size: 22,
                        color:
                            info.isChecked ? Colors.white : Color(0xFF888888),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      info.title,
                      style: theme.textTheme.subtitle1?.merge(
                        TextStyle(
                          color:
                              info.isChecked ? Colors.black : Color(0xFF888888),
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
    ThemeData theme = Theme.of(context);
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
        style: theme.textTheme.headline2,
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

  Widget _buildTransactionItem(ThemeData theme, String title, int count) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$count',
              style: theme.textTheme.caption,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: theme.textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTransactionItem(theme, 'Mặt hàng đã bán', countCategoriesSell),
        SizedBox(width: 20),
        _buildTransactionItem(theme, 'Mặt hàng đã mua', countCategoriesBuy),
      ],
    );
  }
}
