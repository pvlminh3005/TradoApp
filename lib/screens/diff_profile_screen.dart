import 'package:flutter/material.dart';
import '../widgets/appbar_widget.dart';
import '../routes/tab_profile_screen.dart';
import '../widgets/header_info_profile.dart';

class DiffProfileScreen extends StatelessWidget {
  static String routeName = '/diff_profile';
  const DiffProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarWidget(
        background: Colors.white,
      ),
      body: Column(
        children: [
          HeaderInfoProfile(),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: TabScreen(),
            ),
          ),
          // BodyContent(),
        ],
      ),
    );
  }
}
