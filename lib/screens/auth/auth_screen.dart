import 'package:flutter/material.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import 'package:trado_app_uit/providers/auth_provider.dart';
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
  bool isLoading = false;

  @override
  void initState() {
    setState(() {
      tokenUser = getTokenUser();
    });
    print(tokenUser!);
    if (tokenUser!.isEmpty) return;
    // fetchCurrentUser();
    super.initState();
  }

  Future<void> fetchCurrentUser() async {
    await AuthProvider().getCurrentUser();
    print(AuthProvider.currentUser.auth!.id);
  }

  String getTokenUser() {
    return AuthPreferences.getToken() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? LoadingPage()
          : (tokenUser != '' ? NavigatorTab() : SplashScreen()),
    );
  }
}
