// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trado_app_uit/components/loading/loading_app.dart';
import 'package:trado_app_uit/controllers/auth_controller.dart';
import 'package:trado_app_uit/providers/shipping_address_provider.dart';
import 'package:trado_app_uit/screens/dashboard/message_screen.dart';
import 'package:trado_app_uit/screens/message/message_detail_screen.dart';
import '/screens/review/write_review_screen.dart';
import '/constants/dimen.dart';
import '../screens/dashboard/favorite_screen.dart';
import '/widgets/dotted_widget.dart';

import '/constants/constants.dart';
import './navigator_key.dart';
import '../screens/dashboard/notification_screen.dart';
import '../screens/dashboard/home_screen.dart';
import '../screens/dashboard/profile_screen.dart';

class NavigatorTab extends StatefulWidget {
  late int pages;

  NavigatorTab({this.pages = 0});
  @override
  _NavigatorTabState createState() => _NavigatorTabState();
}

class _NavigatorTabState extends State<NavigatorTab> {
  double size = AppDimen.icon_size_big - 2;
  final _screens = [
    HomeScreen(),
    // SuccessScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    MessageScreen(),
    //WriteReviewScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    fetchCurrentUser();
    super.initState();
  }

  Future<void> fetchCurrentUser() async {
    LoadingApp.loadingPage(seconds: 3);

    await AuthController.getCurrentUser();
    await Provider.of<ShippingAddressProvider>(context, listen: false)
        .fetchAllAddresses();
  }

  @override
  Widget build(BuildContext context) {
    Color color = kPrimaryColor;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        // key: NavBarKey.getKey,
        index: widget.pages,
        height: 65,
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            widget.pages = index;
          });
        },
        items: [
          Icon(
            widget.pages == 0
                ? CupertinoIcons.house_fill
                : CupertinoIcons.house,
            size: size,
            color: color,
          ),
          Icon(
            widget.pages == 1
                ? CupertinoIcons.bookmark_fill
                : CupertinoIcons.bookmark,
            size: size,
            color: color,
          ),
          DottedWidget(
            dottedColor: widget.pages == 2 ? Colors.white : null,
            child: Icon(
              widget.pages == 2
                  ? CupertinoIcons.bell_fill
                  : CupertinoIcons.bell,
              size: size,
              color: color,
            ),
          ),
          Icon(
            widget.pages == 3
                ? CupertinoIcons.chat_bubble_2_fill
                : CupertinoIcons.chat_bubble_2,
            size: size,
            color: color,
          ),
          Icon(
            widget.pages == 4
                ? CupertinoIcons.person_alt_circle_fill
                : CupertinoIcons.person_alt_circle,
            size: size + 5,
            color: color,
          ),
        ],
      ),
      body: _screens[widget.pages],
    );
  }
}
