import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trado_app_uit/utils/convert_timer.dart';
import '/routes/routes_manage.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
import '../../components/button_card.dart';
import './background1.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoadingPage = false;
  final String titleApp = 'Chào mừng bạn đến với Trado App';

  @override
  void initState() {
    setState(() {
      isLoadingPage = true;
    });
    convertTimer(() {
      setState(() {
        isLoadingPage = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColorWhite,
      body: isLoadingPage
          ? Center(child: CircularProgressIndicator(color: kPrimaryColor))
          : SingleChildScrollView(
              child: BackgroundType1(
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
                        child: Image.asset(
                            'assets/images/undraw_shopping_eii3.png'),
                      ),
                      ButtonCard(1, 'Đăng nhập', () {
                        Navigator.of(context).pushNamed(RouteManage.signin);
                      }),
                      ButtonCard(2, 'Đăng ký', () {
                        Navigator.of(context).pushNamed(RouteManage.register);
                      }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

//FIX colors
