# IT THINK ZONE CLASSIC NAVIGATION BAR 6

[![Build](https://github.com/jb3rndt/PersistentBottomNavBarV2/actions/workflows/tests.yaml/badge.svg?branch=master)](https://github.com/jb3rndt/PersistentBottomNavBarV2/actions)
[![Coverage](https://codecov.io/gh/jb3rndt/PersistentBottomNavBarV2/branch/master/graph/badge.svg)](https://app.codecov.io/gh/jb3rndt/PersistentBottomNavBarV2/)
[![Pub package version](https://img.shields.io/pub/v/persistent_bottom_nav_bar_v2)](https://pub.dev/packages/persistent_bottom_nav_bar_v2)
[![License](https://img.shields.io/github/license/jb3rndt/PersistentBottomNavBarV2)](https://github.com/jb3rndt/PersistentBottomNavBarV2/blob/master/LICENSE)
[![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/jb3rndt/PersistentBottomNavBarV2)](https://gitHub.com/jb3rndt/PersistentBottomNavBarV2/issues/)
[![GitHub Repo stars](https://img.shields.io/github/stars/jb3rndt/PersistentBottomNavBarV2?style=flat)](https://gitHub.com/jb3rndt/PersistentBottomNavBarV2/stargazers/)

A highly customizable bottom navigation bar for Flutter. It can also be used with your very own style without sacrificing any features. [View on `pub.dev`](https://pub.dev/packages/classic_navigation_bar)




<p align="center">
<img src="https://ik.imagekit.io/rffzpq4rx/Screenshot%202025-05-02%20at%2012.05.47%E2%80%AFAM.png?updatedAt=1746187046797" alt="Preview" style="height:400px;"/>
</p>



## Styles

| Style1                     |                      |                     |
| -------------------------- | -------------------------- | -------------------------- |
| ![style1](https://ik.imagekit.io/rffzpq4rx/Screenshot%202025-05-02%20at%2012.05.47%E2%80%AFAM.png?updatedAt=1746187046797) |  |  |

Note: These do not include all style variations

## Features

- New pages can be pushed with or without showing the navigation bar.
- Supports custom navigation bars
- Handles hardware/software Android back button.
- Supports [go_router](https://pub.dev/packages/go_router) to make use of flutters Router API

## Getting Started

### 1. Install the package

Follow the [install instructions](https://pub.dev/packages/classic_navigation_bar/install).

### 2. Import the package

```dart
import 'package:classic_navigation_bar/classic_navigation_bar.dart';
```

### 3. Use the `ItemNavigation`

The `ItemNavigation` is your top level container that will hold both your navigation bar and all the pages (just like a `Scaffold`). Thats why it is not recommended, like this and you are good to go:

```dart
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
```



## Navigation

Each of your Tabs will get its own Navigator, so they dont interfere with eachother. That means there will now be a difference between calling `Navigator.of(context).push()` (which will push a new screen inside the current tab) and `Navigator.of(context, rootNavigator: true).push()` (which will push a new screen above the whole `PersistentTabView`, ultimately hiding your navigation bar).

The package includes the following utility functions for expressive navigation.

```dart
pushScreen(
  context,
  screen: MainScreen(),
  withNavBar: true/false,
);
```

```dart
pushWithNavBar(
  context,
  MaterialPageRoute(builder: (context) => ...)
);
```

```dart
pushWithoutNavBar(
  context,
  MaterialPageRoute(builder: (context) => ...)
);
```

License

This project is licensed under the MIT License - see the LICENSE file for details.
    ```