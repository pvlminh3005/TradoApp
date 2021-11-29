import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/loading/loading_app.dart';
import '/controllers/auth_controller.dart';
import '/providers/shipping_address_provider.dart';
import '/routes/navigator_tabs_route.dart';
import '/screens/splash/splash_screen.dart';
import '/utils/auth_preferences.dart';

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

  void fetchCurrentUser() {
    LoadingApp.loadingPage(seconds: 3);

    AuthController.getCurrentUser();
    Provider.of<ShippingAddressProvider>(context, listen: false)
        .fetchAllAddresses();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (tokenUser != '' ? NavigatorTab() : SplashScreen()),
    );
  }
}
