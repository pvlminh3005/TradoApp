import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/utils/validator.dart';
import '/providers/auth_provider.dart';
import '/constants/dimen.dart';
import '/components/custom_button.dart';
import '/components/custom_input.dart';

import '/routes/routes_manage.dart';
import '/providers/google/google_signin_controller.dart';
import '../../components/or_divider.dart';
import '../../components/form_question_text.dart';
import '../splash/background2.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final loginKey = GlobalKey<FormState>();

  late TextEditingController userController;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSiginController provider =
        Provider.of<GoogleSiginController>(context, listen: false);
    Size size = MediaQuery.of(context).size;
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
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    CustomInput(
                      controller: userController,
                      hintText: 'Tài khoản',
                      radius: AppDimen.radiusBig_2,
                      maxLength: 30,
                      showPrefixIcon: true,
                      showSuffixIcon: false,
                      backgroundColor: kPrimaryColorLight,
                      prefixIcon: Icons.person,
                      validator: Validator.validateUsername,
                    ),
                    CustomInput(
                      controller: passController,
                      hintText: 'Mật khẩu',
                      margin: const EdgeInsets.symmetric(
                          vertical: AppDimen.spacing_1),
                      radius: AppDimen.radiusBig_2,
                      backgroundColor: kPrimaryColorLight,
                      showPrefixIcon: true,
                      showSuffixIcon: true,
                      prefixIcon: Icons.lock,
                      validator: Validator.validatePassword,
                    ),
                    SizedBox(height: size.width * .03),
                    Consumer<AuthProvider>(
                      builder: (ctx, controller, _) => CustomButton(
                        'Đăng nhập',
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if (loginKey.currentState!.validate()) {
                            await controller.signInApp(
                              context,
                              userController.text,
                              passController.text,
                            );
                          }
                        },
                      ),
                    ),
                  ],
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
                    onTap: () async {
                      await provider.signin();
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
