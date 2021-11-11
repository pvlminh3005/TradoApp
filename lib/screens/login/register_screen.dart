import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/constants.dart';
import 'package:trado_app_uit/providers/auth_provider.dart';
import 'package:trado_app_uit/utils/validator.dart';
import '/constants/dimen.dart';
import '/components/custom_button.dart';
import '/components/custom_input.dart';
import '/routes/routes_manage.dart';
import '../../components/form_question_text.dart';
import '../splash/background2.dart';

class ConCac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final registerKey = GlobalKey<FormState>();

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
                height: size.width * .5,
                fit: BoxFit.cover,
              ),
              Form(
                key: registerKey,
                child: Column(
                  children: [
                    CustomInput(
                      hintText: 'Tài khoản',
                      controller: userController,
                      radius: AppDimen.radiusBig_2,
                      maxLength: 30,
                      showPrefixIcon: true,
                      showSuffixIcon: false,
                      backgroundColor: kPrimaryColorLight,
                      prefixIcon: Icons.person,
                      validator: Validator.validateUsername,
                    ),
                    CustomInput(
                      hintText: 'Mật khẩu',
                      margin: const EdgeInsets.symmetric(
                          vertical: AppDimen.spacing_1),
                      controller: passController,
                      radius: AppDimen.radiusBig_2,
                      showPrefixIcon: true,
                      showSuffixIcon: true,
                      backgroundColor: kPrimaryColorLight,
                      prefixIcon: Icons.lock,
                      validator: Validator.validatePassword,
                    ),
                    SizedBox(height: size.width * .03),
                    Consumer<AuthProvider>(
                      builder: (ctx, controller, _) => CustomButton(
                        'Đăng ký',
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if (registerKey.currentState!.validate()) {
                            await controller.registerApp(
                              context,
                              userController.text,
                              passController.text,
                            );
                          }
                        },
                        // isLoading: controller.isLoading,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimen.spacing_2),
              FormQuestionText(
                login: false,
                toggleNavigator: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteManage.signin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
