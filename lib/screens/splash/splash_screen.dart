import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: BackgroundType1(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleApp,
                style: Theme.of(context).textTheme.caption?.merge(
                      TextStyle(
                        fontFamily: 'Raleway',
                        shadows: [
                          Shadow(
                            offset: Offset(2.5, 4.0),
                            blurRadius: 10.0,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                        ],
                      ),
                    ),
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
