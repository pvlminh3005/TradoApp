import 'package:flutter/material.dart';
import '/constants/constants.dart';
import './diff_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: DiffProfileScreen(),
    );
  }
}
