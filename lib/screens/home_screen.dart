import 'package:flutter/material.dart';
import './diff_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: DiffProfileScreen(),
    );
  }
}
