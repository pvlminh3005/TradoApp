import 'package:flutter/material.dart';
import '/constants/constants.dart';
import 'custom_text.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              'Hoặc đăng nhập với',
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          _buildDivider(),
        ],
      ),
    );
  }
}

Expanded _buildDivider() {
  return Expanded(
    child: Divider(
      color: kPrimaryColor,
      height: 1.5,
      thickness: 1.5,
    ),
  );
}
