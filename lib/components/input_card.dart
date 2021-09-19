import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final IconData icon;
  InputCard(
      {required this.hintText,
      required this.controller,
      required this.onChanged,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * .7,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFBBBBBB),
                ),
                icon: Icon(icon, color: Theme.of(context).primaryColor),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class InputPasswordCard extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final IconData icon;
  bool checkObscure;
  InputPasswordCard({
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.icon,
    this.checkObscure = true,
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
        color: Theme.of(context).primaryColorLight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintMaxLines: 1,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFBBBBBB),
                ),
                icon: Icon(icon, color: Theme.of(context).primaryColor),
                suffixIcon: GestureDetector(
                  onTap: () {
                    checkObscure = !checkObscure;
                  },
                  child: Icon(
                    Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
              obscureText: checkObscure,
            ),
          ),
        ],
      ),
    );
  }
}
