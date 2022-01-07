import 'package:flutter/material.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import 'package:trado_app_uit/models/user_model.dart';
import 'package:trado_app_uit/widgets/header_info_profile.dart';
import 'package:trado_app_uit/widgets/loading_page.dart';

import '/constants/constants.dart';
import '../../widgets/appbar_widget.dart';
import '../../routes/tab_profile_screen.dart';

class DiffProfileScreen extends StatefulWidget {
  final String? idUser;

  const DiffProfileScreen({
    this.idUser,
    Key? key,
  }) : super(key: key);

  @override
  State<DiffProfileScreen> createState() => _DiffProfileScreenState();
}

class _DiffProfileScreenState extends State<DiffProfileScreen> {
  late UserModel profile;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    fetchDataUser();
  }

  Future fetchDataUser() async {
    setState(() {
      isLoading = true;
    });
    profile = await AuthController.getUserById(widget.idUser!);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return LoadingPage();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBarWidget(
        background: kBackgroundColorWhite,
      ),
      body: Column(
        children: [
          HeaderInfoProfile(profile: profile),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: TabScreen(profile: profile, idUser: widget.idUser),
            ),
          ),
          // BodyContent(),
        ],
      ),
    );
  }
}

//FIX colors
