import 'package:flutter/material.dart';

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
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.merge(TextStyle(color: Colors.white)),
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
                color: Theme.of(context).primaryColorLight),
            child: Center(
              child: Text(title, style: Theme.of(context).textTheme.button),
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
                color: Theme.of(context).errorColor),
            child: Center(
              child: Text(title, style: Theme.of(context).textTheme.button),
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
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.merge(TextStyle(color: Colors.white)),
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
