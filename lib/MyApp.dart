import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/routes/providers_manage.dart';
import '/routes/routes_manage.dart';
import '/screens/auth/auth_screen.dart';
import '/constants/constants.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderManage.providersApp,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: font_family,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: AuthScreen(),
        routes: RouteManage.routesApp,
      ),
    );
  }
}
