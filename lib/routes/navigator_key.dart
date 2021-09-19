import 'package:flutter/material.dart';

class NavBarKey {
  NavBarKey._();

  static final GlobalKey _key = GlobalKey();

  static GlobalKey get getKey => _key;
}
