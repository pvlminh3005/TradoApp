import 'package:flutter/material.dart';

class BackgroundType2 extends StatelessWidget {
  final Widget child;
  BackgroundType2({required this.child});
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
            top: size.width * .1,
            left: size.width * .03,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Positioned(
            bottom: -size.width * .4 / 1.7,
            right: -size.width * .4 / 1.7,
            child: ClipOval(
              child: Container(
                width: size.width * .4,
                height: size.width * .4,
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

//FIX colors
