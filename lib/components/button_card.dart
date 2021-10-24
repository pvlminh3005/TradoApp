import 'package:flutter/material.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';

class ButtonCard extends StatelessWidget {
  final int statusCheck;
  final String title;
  final Function() toggleButton;

  ButtonCard(this.statusCheck, this.title, this.toggleButton);

  Widget _buildFormButton(BuildContext context, int status) {
    switch (status) {
      case 1:
        return GestureDetector(
          onTap: toggleButton,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * .7,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kPrimaryColor,
            ),
            child: Center(
              child: Text(
                title,
                style: kTextBoldLight_20,
              ),
            ),
          ),
        );
      case 2:
        return GestureDetector(
          onTap: toggleButton,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * .7,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kPrimaryColorLight,
            ),
            child: Center(
              child: Text(
                title,
                style: kTextBoldDark_20,
              ),
            ),
          ),
        );
      case 3:
        return GestureDetector(
          onTap: toggleButton,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * .7,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kErrorColor,
            ),
            child: Center(
              child: Text(
                title,
                style: kTextBoldDark_20,
              ),
            ),
          ),
        );
      default:
        return GestureDetector(
          onTap: toggleButton,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width * .7,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kPrimaryColor,
            ),
            child: Center(
              child: Text(
                title,
                style: kTextBoldLight_20,
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildFormButton(context, this.statusCheck);
  }
}

//FIX color
