Classic Navigation Bar
A customizable bottom navigation bar for Flutter with smooth animations, gradient effects, and flexible styling options.

Features

Smooth animations with customizable curves and durations.
Gradient and color customization for the navigation bar background.
Adjustable border radius and border colors.
Supports icons and labels with animated transitions.
Lightweight and easy to integrate into any Flutter app.

Installation
Add this to your pubspec.yaml:
dependencies:
classic_navigation_bar: ^0.1.2

Run:
flutter pub get

Usage
Import the package:
import 'package:classic_navigation_bar/classic_navigation_bar.dart';

Use ClassicNavigationBar as the bottomNavigationBar in a Scaffold. Provide a list of ItemNavigation widgets for each tab, and handle page changes with the onChangePage callback.
Example
Here’s an example of how to use ClassicNavigationBar to create a bottom navigation bar with four tabs, using remixicon for icons and a gradient effect:
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:classic_navigation_bar/src/constants.dart';
import 'package:classic_navigation_bar/classic_navigation_bar.dart';

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

Styling
You can customize the ClassicNavigationBar with various properties:

Animation: Adjust the durationAnimation and curve for smooth transitions.
Appearance: Use borderRadius, gradient, and backgroundColor to style the bar.
Icons and Labels: Customize the ItemNavigation widgets with childBefore and childAfter for different icon states.

For example, to change the border radius and animation duration:
ClassicNavigationBar(
borderRadius: BorderRadius.circular(15),
durationAnimation: const Duration(milliseconds: 500),
curve: Curves.easeIn,
// Other properties...
)

Showcase
Watch the ClassicNavigationBar in action:

Screenshots



Home Tab
Search Tab
Chat Tab
Settings Tab









Contributing
Contributions are welcome! Please open an issue or submit a pull request on GitHub.
License
This project is licensed under the MIT License - see the LICENSE file for details.
