import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes/navigator_tabs_route.dart';
import 'providers/google/google_signin_controller.dart';
import 'screens/login/signin_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'screens/login/signup_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoogleSiginController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          primaryColor: Color(0xFF3EBACE),
          primaryColorDark: Color(0xFF37E2E2),
          primaryColorLight: Color(0xFFD0EFF1),
          backgroundColor: Color(0xFFF3F3F3),
          errorColor: Color(0xFFDA3400),
          highlightColor: Color(0xFFFF9C07),
          textTheme: TextTheme(
            caption: TextStyle(
              fontSize: 24,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            button: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            headline1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          "/": (_) => SplashScreen(),
          SigninScreen.routeName: (_) => SigninScreen(),
          SignupScreen.routeName: (_) => SignupScreen(),
          NavigatorTab.routeName: (_) => NavigatorTab(),
        },
      ),
    );
  }
}
