import 'package:flutter/material.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';

class InputCard extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  InputCard({
    required this.hintText,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * .7,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kPrimaryColorLight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: kTextPlaceholder,
                icon: Icon(icon, color: kPrimaryColor),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
