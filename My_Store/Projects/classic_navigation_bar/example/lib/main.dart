import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:classic_navigation_bar/classic_navigation_bar.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classic Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationScreen(),
    );
  }
}



class NavigationScreen extends StatefulWidget {
  final int index;
  const NavigationScreen({super.key, this.index = 0});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  double iconSize = 21;
  Color activeIconColor = primaryColor;
  Color inactiveIconColor = Colors.black.withValues(alpha: 0.7);

  // Navigation screens
  final navigationChange = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Chat Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationChange.elementAt(currentIndex),
      bottomNavigationBar: ClassicNavigationBar(
        backgroundColor: white,
        lineHeight: 2,
        durationAnimation: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        color: primaryColor,
        borderRadius: BorderRadius.circular(30),
        borderTopColor: black.withValues(alpha: 0.2),
        gradient: LinearGradient(
          colors: [
            primaryColor.withValues(alpha: 0.3),
            primaryColor.withValues(alpha: 0.2),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: const [.0, 1.0],
          tileMode: TileMode.decal,
        ),
        onChangePage: (v) {
          setState(() {
            currentIndex = v;
          });
        },
        items: [
          ItemNavigation(
            childAfter: Icon(
              Remix.home_fill,
              color: activeIconColor,
              size: iconSize,
            ),
            childBefore: Icon(
              Remix.home_line,
              color: inactiveIconColor,
              size: iconSize,
            ),
            label: 'Home',
          ),
          ItemNavigation(
            childAfter: Icon(
              Remix.search_fill,
              color: activeIconColor,
              size: iconSize,
            ),
            childBefore: Icon(
              Remix.search_line,
              color: inactiveIconColor,
              size: iconSize,
            ),
            label: 'Search',
          ),
          ItemNavigation(
            childAfter: Icon(
              Remix.chat_1_fill,
              color: activeIconColor,
              size: iconSize,
            ),
            childBefore: Icon(
              Remix.chat_1_line,
              color: inactiveIconColor,
              size: iconSize,
            ),
            label: 'Chat',
          ),
          ItemNavigation(
            childAfter: Icon(
              Remix.settings_4_fill,
              color: activeIconColor,
              size: iconSize,
            ),
            childBefore: Icon(
              Remix.settings_4_line,
              color: inactiveIconColor,
              size: iconSize,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}