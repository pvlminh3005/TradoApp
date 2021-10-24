import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/constants/sizes.dart';
import '../../components/button_card.dart';
import '../login/signin_screen.dart';
import '../login/signup_screen.dart';
import './background1.dart';

class SplashScreen extends StatelessWidget {
  final String titleApp = 'Chào mừng bạn đến với Trado App';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColorWhite,
      body: BackgroundType1(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleApp,
                style: kTextCaption,
                textAlign: TextAlign.center,
              ),
              Container(
                width: size.width * .8,
                height: size.width * .8,
                child: Image.asset('assets/images/undraw_shopping_eii3.png'),
              ),
              ButtonCard(1, 'Đăng nhập', () {
                Navigator.of(context).pushNamed(SigninScreen.routeName);
              }),
              ButtonCard(2, 'Đăng ký', () {
                Navigator.of(context).pushNamed(SignupScreen.routeName);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

//FIX colors
