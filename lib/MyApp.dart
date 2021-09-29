import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/providers/category_provider.dart';
import '../routes/navigator_tabs_route.dart';
import 'providers/google/google_signin_controller.dart';
import 'providers/rate_category_provider.dart';
import 'screens/category_detail_screen.dart';
import 'screens/login/signin_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'screens/login/signup_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GoogleSiginController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RateCategoryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          primaryColor: Color(0xFF3EBACE),
          primaryColorDark: Color(0xFF37E2E2),
          primaryColorLight: Color(0xFFD0EFF1),
          backgroundColor: Color(0xFFF3F3F3),
          cardColor: Colors.white,
          errorColor: Color(0xFFDA3400),
          dialogBackgroundColor: Color(0xFFFDF5F5),
          highlightColor: Color(0xFFFF9C07),
          textSelectionColor: Color(0xFF777777),
          accentColor: Color(0xFFE0E0E0),
          textTheme: TextTheme(
            caption: TextStyle(
              fontSize: 24,
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
            bodyText2: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            headline1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          "/": (_) => SplashScreen(),
          SigninScreen.routeName: (_) => SigninScreen(),
          SignupScreen.routeName: (_) => SignupScreen(),
          NavigatorTab.routeName: (_) => NavigatorTab(),
          CategoryDetailScreen.routeName: (_) => CategoryDetailScreen(),
        },
      ),
    );
  }
}
