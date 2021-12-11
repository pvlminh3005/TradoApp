import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/routes/routes_manage.dart';
import 'package:trado_app_uit/screens/login/signin_screen.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';
import '/components/loading/loading_app.dart';
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
  bool haveToken = false;
  String? tokenUser = '';

  @override
  void initState() {
    checkExpiredToken().then((res) {
      if (!haveToken) {
        AuthPreferences.removeToken();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteManage.signin, (route) => false);
        return;
      } //failed

      setState(() {
        tokenUser = getTokenUser();
      });

      fetchCurrentUser();

      Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteManage.navigator_tab, (route) => true);
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoadingPage());
  }
}
