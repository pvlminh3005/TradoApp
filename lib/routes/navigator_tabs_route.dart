import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './navigator_key.dart';
import '../screens/highlight_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/home_screen.dart';
import '../screens/message_screen.dart';
import '../screens/profile_screen.dart';

class NavigatorTab extends StatefulWidget {
  static const routeName = '/tabnavigator';
  @override
  _NavigatorTabState createState() => _NavigatorTabState();
}

class _NavigatorTabState extends State<NavigatorTab> {
  int _pages = 0;
  final _screens = [
    HomeScreen(),
    HighlightScreen(),
    NotificationScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: NavBarKey.getKey,
        index: 0,
        height: 65,
        backgroundColor: Theme.of(context).backgroundColor,
        // buttonBackgroundColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _pages = index;
            color = Colors.red;
          });
        },
        items: [
          Icon(
            Icons.home,
            size: 27,
            color: color,
          ),
          Icon(
            Icons.verified,
            size: 27,
            color: color,
          ),
          Icon(
            Icons.notifications,
            size: 27,
            color: color,
          ),
          Icon(
            Icons.question_answer,
            size: 27,
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
