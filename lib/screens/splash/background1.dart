import 'package:flutter/material.dart';

class BackgroundType1 extends StatelessWidget {
  final Widget child;
  BackgroundType1({required this.child});
  @override
  Widget build(BuildContext context) {
    Color theme = Theme.of(context).primaryColor;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -size.width * .5 / 2.5,
            left: -size.width * .5 / 2.5,
            child: Container(
              width: size.width * .5,
              height: size.width * .5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.withOpacity(.65),
              ),
            ),
          ),
          Positioned(
            bottom: -size.width * .55 / 2.5,
            left: -size.width * .7 / 2.5,
            child: ClipOval(
              child: Container(
                width: size.width * .55,
                height: size.width * .7,
                color: theme.withOpacity(.65),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
