import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/screens/auth/auth_screen.dart';
import '/providers/login/register_provider.dart';
import 'providers/login/signin_provider.dart';
import '/constants/constants.dart';

import 'providers/notification_provider.dart';
import 'providers/rate_review_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/category_provider.dart';
import 'providers/google/google_signin_controller.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignInProvider(),
        ),
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
          primaryColor: kPrimaryColor,
        ),
        home: AuthScreen(),
        routes: RouteManage.routesApp,
      ),
    );
  }
}
