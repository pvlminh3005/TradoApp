import 'package:flutter/material.dart';
import 'package:trado_app_uit/widgets/header_info_profile.dart';

import '/constants/constants.dart';
import '../../widgets/appbar_widget.dart';
import '../../routes/tab_profile_screen.dart';

class DiffProfileScreen extends StatelessWidget {
  const DiffProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBarWidget(
        background: kBackgroundColorWhite,
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

//FIX colors
