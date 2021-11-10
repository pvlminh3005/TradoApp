import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/widgets/dotted_widget.dart';
import '/screens/success_screen.dart';
import '/screens/checkout_screen.dart';

import '/constants/constants.dart';
import './navigator_key.dart';
import '../screens/notification_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class NavigatorTab extends StatefulWidget {
  @override
  _NavigatorTabState createState() => _NavigatorTabState();
}

class _NavigatorTabState extends State<NavigatorTab> {
  double size = 27;
  int _pages = 0;
  final _screens = [
    HomeScreen(),
    SuccessScreen(),
    // HighlightScreen(),
    NotificationScreen(),
    // MessageScreen(),
    CheckOutScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Color color = kPrimaryColor;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        key: NavBarKey.getKey,
        index: 0,
        height: 65,
        backgroundColor: Colors.transparent,
        // buttonBackgroundColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _pages = index;
          });
        },
        items: [
          Icon(
            _pages == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house,
            size: size,
            color: color,
          ),
          Icon(
            _pages == 1
                ? CupertinoIcons.bookmark_fill
                : CupertinoIcons.bookmark,
            size: size,
            color: color,
          ),
          DottedWidget(
            dottedColor: _pages == 2 ? Colors.white : null,
            child: Icon(
              _pages == 2 ? CupertinoIcons.bell_fill : CupertinoIcons.bell,
              size: size,
              color: color,
            ),
          ),
          Icon(
            _pages == 3
                ? CupertinoIcons.chat_bubble_2_fill
                : CupertinoIcons.chat_bubble_2,
            size: size,
            color: color,
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
              'assets/images/background_blue.jpeg',
            ),
          ),
        ],
      ),
      body: _screens[_pages],
    );
  }
}
