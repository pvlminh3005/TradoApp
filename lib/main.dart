import 'package:flutter/material.dart';
import '/components/loading/config_loading.dart';
import 'MyApp.dart';
import 'package:flutter/services.dart';

import 'utils/auth_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
  ));
  await AuthPreferences.init();

  runApp(MyApp());
  configLoading();
}
