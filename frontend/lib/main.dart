import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navBar.dart';
import 'pages/signIn/login.dart';

void main() => runApp(MyApp());

// GlobalKey<NavigatorState> currentNavigatorKey(index) {
//   switch (index) {
//     case 0:
//       return mapKey;
//       break;
//     case 1:
//       return projectsKey;
//       break;
//     case 2:
//       return cardsKey;
//       break;
//     case 3:
//       return chatKey;
//       break;
//     case 4:
//       return profileKey;
//       break;
//   }
//   return null;
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  Tab _tabItem(IconData iconData, int index, Color selectedColor) {
    return Tab(
      icon: FaIcon(
        iconData,
        size: 26,
        color: _tabController.index == index ? selectedColor : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: UndergroundNavbar(),
          ),
        ),
      ),
    );
  }
}
