import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/rating_and_review_screen.dart';
import 'providers/notification_provider.dart';
import 'providers/rate_review_provider.dart';
import 'screens/cart_screen.dart';
import 'screens/diff_profile_screen.dart';
import 'providers/cart_provider.dart';
import 'providers/category_provider.dart';
import 'routes/navigator_tabs_route.dart';
import 'providers/google/google_signin_controller.dart';
import 'screens/category_detail_screen.dart';
import 'screens/login/signin_screen.dart';
import 'screens/splash/splash_screen.dart';
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
          create: (_) => RateReviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          primaryColor: Color(0xFF3EBACE),
          primaryColorLight: Color(0xFFD0EFF1),
          backgroundColor: Color(0xFFF3F5F7),
          cardColor: Colors.white,
          errorColor: Color(0xFFDA3400),
          dialogBackgroundColor: Color(0xFFFFE5E5),
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
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            bodyText2: TextStyle(
              fontSize: 15,
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
            subtitle2: TextStyle(
              fontSize: 10,
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
          CartScreen.routeName: (_) => CartScreen(),
          DiffProfileScreen.routeName: (_) => DiffProfileScreen(),
          RatingAndReviewScreen.routeName: (_) => RatingAndReviewScreen(),
        },
      ),
    );
  }
}
