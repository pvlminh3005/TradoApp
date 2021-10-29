import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import '/components/custom_button.dart';
import '/components/custom_input.dart';
import '/components/custom_input_password.dart';
import '/providers/login/register_provider.dart';
import '/routes/routes_manage.dart';
import '../../components/form_question_text.dart';
import '../splash/background2.dart';

class ConCac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController userController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
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
              CustomInput(
                hintText: 'Tài khoản',
                controller: userController,
                icon: Icons.person,
              ),
              CustomInputPassword(
                hintText: 'Mật khẩu',
                controller: passController,
              ),
              SizedBox(height: size.width * .03),
              Consumer<RegisterProvider>(
                builder: (ctx, controller, _) => CustomButton(
                  'Đăng ký',
                  onTap: () {
                    controller.registerApp(
                      userController.text,
                      passController.text,
                    );
                  },
                  isLoading: controller.isLoading,
                ),
              ),
              SizedBox(height: size.width * .05),
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