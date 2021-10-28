import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/components/custom_button.dart';
import '/components/custom_input.dart';
import '/components/custom_input_password.dart';

import '/routes/routes_manage.dart';
import '/providers/login/signin_provider.dart';
import '/providers/google/google_signin_controller.dart';
import '../../components/or_divider.dart';
import '../../components/form_question_text.dart';
import '../splash/background2.dart';

class SigninScreen extends StatelessWidget {
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
              CustomInput(
                hintText: 'Tài khoản',
                controller: userController,
                icon: Icons.person,
              ),
              CustomInputPassword(
                hintText: 'Mật khẩu',
                controller: passController,
                icon: Icons.lock,
              ),
              SizedBox(height: size.width * .03),
              Consumer<SignInProvider>(
                builder: (ctx, controller, _) => CustomButton(
                  title: 'Đăng nhập',
                  onTap: () {
                    controller.signInApp(
                      context,
                      userController.text,
                      passController.text,
                    );
                  },
                  isLoading: controller.isLoading,
                ),
              ),
              SizedBox(height: size.width * .05),
              FormQuestionText(
                login: true,
                toggleNavigator: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteManage.register);
                },
              ),
              SizedBox(height: size.width * .1),
              Column(
                children: [
                  OrDivider(),
                  SizedBox(height: size.width * .1),
                  GestureDetector(
                    onTap: () {
                      // provider.signin();
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
