import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/custom_button.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import 'package:trado_app_uit/constants/dimen.dart';
import '/utils/convert_timer.dart';
import '/widgets/loading_page.dart';
import '/routes/routes_manage.dart';
import '/constants/constants.dart';
import '/constants/sizes.dart';
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
          ? LoadingPage()
          : SingleChildScrollView(
              child: BackgroundType1(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        titleApp,
                        align: TextAlign.center,
                        fontSize: FontSize.BIG_2,
                        fontWeight: FontWeight.w700,
                        textShadow: [
                          Shadow(
                            color: kBlack.withOpacity(.15),
                            offset: Offset(4, 4),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * .8,
                        height: size.width * .8,
                        child: Image.asset(
                            'assets/images/undraw_shopping_eii3.png'),
                      ),
                      CustomButton(
                        'Đăng nhập',
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimen.verticalSpacing_16),
                        margin: const EdgeInsets.symmetric(
                          vertical: AppDimen.spacing_1,
                          horizontal: AppDimen.spacing_2,
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(RouteManage.signin);
                        },
                      ),
                      CustomButton(
                        'Đăng ký',
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimen.verticalSpacing_16),
                        margin: const EdgeInsets.symmetric(
                          vertical: AppDimen.spacing_1,
                          horizontal: AppDimen.spacing_2,
                        ),
                        textColor: kTextDark,
                        backgroundColor: kPrimaryColorLight,
                        onTap: () {
                          Navigator.of(context).pushNamed(RouteManage.register);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

//FIX colors
