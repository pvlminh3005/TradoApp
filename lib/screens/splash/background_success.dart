import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';

class BackgroundSuccess extends StatelessWidget {
  final Widget? child;

  const BackgroundSuccess({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -size.width * .5 / 2,
            right: -size.width * .5 / 2,
            child: Container(
              width: size.width * .6,
              height: size.width * .6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor.withOpacity(.4),
              ),
            ),
          ),
          Positioned(
            bottom: size.width * .3,
            left: -size.width * .5 / 2,
            child: ClipOval(
              child: Container(
                width: size.width * .35,
                height: size.width * .35,
                color: kPrimaryColor.withOpacity(.4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimen.spacing_3),
            child: child,
          ),
        ],
      ),
    );
  }
}
