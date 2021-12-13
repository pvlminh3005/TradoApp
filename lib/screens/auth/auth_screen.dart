import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/routes/routes_manage.dart';
import '/widgets/loading_page.dart';
import '/components/loading/loading_app.dart';
import '/controllers/auth_controller.dart';
import '/providers/shipping_address_provider.dart';
import '/utils/auth_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool haveToken = false;
  String? tokenUser = '';

  @override
  void initState() {
    checkExpiredToken().then((res) async {
      if (!haveToken) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteManage.splash, (route) => false);
        return;
      } //failed

      setState(() {
        tokenUser = getTokenUser();
      });

      await fetchCurrentUser();

      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteManage.navigator_tab, (route) => false);
    });

    super.initState();
  }

  Future<void> checkExpiredToken() async {
    Map msgError = await AuthController.checkToken();

    setState(() {
      haveToken = msgError.isNotEmpty;
    });
  }

  String getTokenUser() {
    return AuthPreferences.getToken() ?? '';
  }

  Future<void> fetchCurrentUser() async {
    LoadingApp.loadingPage(seconds: 3);

    await AuthController.getCurrentUser();
    Provider.of<ShippingAddressProvider>(context, listen: false)
        .fetchAllAddresses();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_trado.png',
            width: size.width * .8,
            height: size.width * .6,
            fit: BoxFit.cover,
          ),
          LoadingPage(width: 4),
        ],
      ),
    );
  }
}
