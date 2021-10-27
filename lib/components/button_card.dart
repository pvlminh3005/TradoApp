import 'package:flutter/material.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';

class ButtonCard extends StatelessWidget {
  final int statusCheck;
  final String title;
  final bool isLoading;
  final Function() toggleButton;

  const ButtonCard(
    this.statusCheck,
    this.title,
    this.toggleButton, {
    this.isLoading = false,
  });

  Widget _buildFormButton(BuildContext context, int status) {
    switch (status) {
      case 1:
        return DefaultButtonCard(
          toggleButton: toggleButton,
          isLoading: isLoading,
          child: Text(
            title,
            style: kTextBoldLight_20,
          ),
        );
      case 2:
        return DefaultButtonCard(
          toggleButton: toggleButton,
          isLoading: isLoading,
          color: kPrimaryColorLight,
          child: Text(
            title,
            style: kTextBoldDark_20,
          ),
        );
      case 3:
        return DefaultButtonCard(
          toggleButton: toggleButton,
          isLoading: isLoading,
          color: kErrorColor,
          child: Text(
            title,
            style: kTextBoldDark_20,
          ),
        );
      default:
        return DefaultButtonCard(
          toggleButton: toggleButton,
          isLoading: isLoading,
          child: Text(
            title,
            style: kTextBoldLight_20,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildFormButton(context, this.statusCheck);
  }
}

class DefaultButtonCard extends StatelessWidget {
  final bool isLoading;
  final Function() toggleButton;
  final Widget child;
  final Color color;

  const DefaultButtonCard({
    required this.toggleButton,
    this.isLoading = false,
    this.child = const SizedBox.shrink(),
    this.color = kPrimaryColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleButton,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * .7,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    color: kBackgroundColorWhite,
                    strokeWidth: 2,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}

//FIX color
