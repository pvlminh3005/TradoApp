import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import 'package:trado_app_uit/providers/auth_provider.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import '/routes/navigator_tabs_route.dart';
import '/screens/splash/splash_screen.dart';
import '/utils/auth_preferences.dart';
import '/widgets/loading_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? tokenUser = '';

  @override
  void initState() {
    setState(() {
      tokenUser = getTokenUser();
    });

    if (tokenUser!.isEmpty) return;
    fetchCurrentUser();

    super.initState();
  }

  String getTokenUser() {
    return AuthPreferences.getToken() ?? '';
  }

  Future<void> fetchCurrentUser() async {
    await AuthController.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (tokenUser != '' ? NavigatorTab() : SplashScreen()),
    );
  }
}
