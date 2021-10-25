import 'package:flutter/material.dart';
import 'package:trado_app_uit/routes/navigator_tabs_route.dart';
import 'package:trado_app_uit/screens/splash/splash_screen.dart';
import 'package:trado_app_uit/utils/auth_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? tokenUser = '';

  @override
  void initState() {
    tokenUser = AuthPreferences.getToken() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tokenUser! != '' ? NavigatorTab() : SplashScreen(),
    );
  }
}
