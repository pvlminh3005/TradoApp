import 'package:flutter/material.dart';
import 'package:trado_app_uit/screens/tab_profile_screen.dart';
import '../widgets/header_info_profile.dart';

class DiffProfileScreen extends StatelessWidget {
  const DiffProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
