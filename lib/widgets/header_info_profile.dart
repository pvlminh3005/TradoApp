import 'package:flutter/material.dart';

import 'grid_button.dart';

class HeaderInfoProfile extends StatelessWidget {
  const HeaderInfoProfile({Key? key}) : super(key: key);

  Widget _buildAmountFollow(ThemeData theme, num follow, String content) {
    return RichText(
      text: TextSpan(
        style: theme.textTheme.headline2,
        children: [
          TextSpan(
            text: (follow is int)
                ? '$follow '
                : '${(follow * 100).toStringAsFixed(0)}% ',
            style: theme.textTheme.headline2?.merge(
              TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TextSpan(text: content),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      color: theme.cardColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: size.width * .1,
                  backgroundImage:
                      AssetImage('assets/images/background_blue.jpeg'),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoAccount(
                      name: 'Le Minh',
                      countPerStars: 4,
                      countRating: 21,
                    ),
                    Row(
                      children: [
                        _buildAmountFollow(theme, 100, 'quan tâm'),
                        SizedBox(width: 8.0),
                        _buildAmountFollow(theme, 1.0, 'phản hồi'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          GridButton(),
        ],
      ),
    );
  }
}

class _buildInfoAccount extends StatelessWidget {
  final String name;
  final double countPerStars;
  final int countRating;

  const _buildInfoAccount({
    required this.name,
    this.countPerStars = 5,
    required this.countRating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: theme.textTheme.headline1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              size: 22,
              color: theme.highlightColor,
            ),
            Text(
              '$countPerStars',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: theme.highlightColor,
              ),
            ),
            Text(
              ' ($countRating)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
