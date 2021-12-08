import 'package:firebase_core/firebase_core.dart';
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
  await Firebase.initializeApp();
  await AuthPreferences.init();

  runApp(MyApp());
  configLoading();
}
