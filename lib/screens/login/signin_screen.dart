import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/providers/google/google_signin_controller.dart';

import '../../routes/navigator_tabs_route.dart';
import '../../components/or_divider.dart';
import './signup_screen.dart';
import '../../components/button_card.dart';
import '../../components/form_question_text.dart';
import '../../components/input_card.dart';
import '../splash/background2.dart';

class SigninScreen extends StatelessWidget {
  static const routeName = '/signin';
  @override
  Widget build(BuildContext context) {
    GoogleSiginController provider =
        Provider.of<GoogleSiginController>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: BackgroundType2(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_trado.png',
                width: size.width * .8,
                height: size.width * .6,
                fit: BoxFit.cover,
              ),
              InputCard(
                hintText: 'Tài khoản',
                controller: userController,
                onChanged: (value) {},
                icon: Icons.person,
              ),
              InputPasswordCard(
                hintText: 'Mật khẩu',
                controller: passController,
                onChanged: (value) {},
                icon: Icons.lock,
              ),
              SizedBox(height: size.width * .03),
              ButtonCard(1, 'Đăng nhập', () {
                Navigator.of(context).pushNamed(NavigatorTab.routeName);
              }),
              SizedBox(height: size.width * .05),
              FormQuestionText(
                login: true,
                toggleNavigator: () {
                  Navigator.of(context).pushNamed(SignupScreen.routeName);
                },
              ),
              SizedBox(height: size.width * .1),
              Column(
                children: [
                  OrDivider(),
                  SizedBox(height: size.width * .1),
                  GestureDetector(
                    onTap: () {
                      provider.signin();
                    },
                    child: Image.asset(
                      'assets/images/google.png',
                      width: size.width * .12,
                      height: size.width * .12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
