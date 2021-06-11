import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'pages/chat/chatlist.dart';
import 'pages/lounge/loungeMain.dart';
import 'pages/search/searchmain.dart';
import 'setting/settingmain.dart';

class UndergroundNavbar extends StatefulWidget {
  final bool isFromSignUp;

  UndergroundNavbar({this.isFromSignUp = false}) : super(key: navbarKey);

  @override
  UndergroundNavbarState createState() => UndergroundNavbarState();
}

class UndergroundNavbarState extends State<UndergroundNavbar> {
  final myKey = new GlobalKey<UndergroundNavbarState>();

  CupertinoTabController _controller;

  // String active(String image) => "images/navbar/active/${image}_active.svg";

  // String inactive(String image) => "images/navbar/inactive/$image.svg";

  int _currentIndex = 0;

  double height = 19.35;

  Future<bool> onItemTapped(int index) async {
    if (index == _currentIndex) {
      switch (index) {
        case 0:
          mainKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 1:
          mapKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 2:
          ratingKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 3:
          settingsKey.currentState.popUntil((r) => r.isFirst);
          break;
      }
    } else
      setState(() => _currentIndex = index);
    return true;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: CupertinoTabScaffold(
              controller: _controller,
              key: myKey,
              tabBar: CupertinoTabBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  navbarItem("История", "main", 0),
                  navbarItem("Карта", "map", 1),
                  navbarItem("Рейтинг", "rating", 2),
                  navbarItem("Настройки", "settings", 3)
                ],
                onTap: onItemTapped,
              ),
              tabBuilder: (context, index) {
                CupertinoTabView currentPage;
                switch (index) {
                  case 0:
                    currentPage = CupertinoTabView(
                        navigatorKey: mainKey,
                        builder: (buildContext) => SearchMain());
                    break;
                  case 1:
                    currentPage = CupertinoTabView(
                        navigatorKey: mapKey,
                        builder: (context) => LoungeMain());
                    break;
                  case 2:
                    currentPage = CupertinoTabView(
                        navigatorKey: ratingKey,
                        builder: (context) => ChatList());
                    break;
                  case 3:
                    currentPage = CupertinoTabView(
                        navigatorKey: settingsKey,
                        builder: (buildContext) => SettingMain());
                    break;
                }
                return currentPage;
              })));

  BottomNavigationBarItem navbarItem(String name, image, int index) =>
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          /**
           * SvgPicture.asset(_currentIndex == index
              ? "images/navbar/active/${image}_active.svg"
              : "images/navbar/inactive/${image}_inactive.svg"),
           */
          title: Text(name,
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: _currentIndex == index ? Colors.blue : null)));
}
