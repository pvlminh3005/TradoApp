import 'package:flutter/material.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/constants/dimen.dart';

class IconSuccess extends StatelessWidget {
  const IconSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCircle(),
        _buildTick(),
      ],
    );
  }

  Widget _buildCircle() {
    return Container(
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.5,
          color: kBlack.withOpacity(.5),
        ),
      ),
      child: Image.asset('assets/images/waiting_icon.png'),
    );
  }

  Widget _buildTick() {
    return Positioned(
      bottom: 5,
      right: 10.0,
      child: Image.asset(
        'assets/images/success.png',
        width: 25,
        height: 25,
      ),
    );
  }
}
