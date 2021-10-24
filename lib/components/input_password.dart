import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/sizes.dart';
import '/constants/constants.dart';

class InputPassword extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;

  const InputPassword({
    required this.hintText,
    required this.controller,
    required this.icon,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool obscureText = true;
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
              controller: widget.controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintMaxLines: 1,
                hintText: widget.hintText,
                hintStyle: kTextPlaceholder,
                icon: Icon(widget.icon, color: kPrimaryColor),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                ),
                border: InputBorder.none,
              ),
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }
}

//FIX colors