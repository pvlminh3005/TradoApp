import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/constants/dimen.dart';
import '/screens/message_screen.dart';
import '/screens/favorite_screen.dart';
import '/widgets/dotted_widget.dart';

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
  double size = AppDimen.icon_size_big - 2;
  int _pages = 0;
  final _screens = [
    HomeScreen(),
    // SuccessScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    MessageScreen(),
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
          Icon(
            _pages == 4
                ? CupertinoIcons.person_alt_circle_fill
                : CupertinoIcons.person_alt_circle,
            size: size + 5,
            color: color,
          ),
        ],
      ),
      body: _screens[_pages],
    );
  }
}
