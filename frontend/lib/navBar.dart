import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'pages/cards/searchmain.dart';
import 'pages/profile/profileDate.dart';
import 'pages/projects/projects.dart';

class UndergroundNavbar extends StatefulWidget {
  final bool isFromSignUp;

  UndergroundNavbar({this.isFromSignUp = false}) : super(key: navbarKey);

  @override
  UndergroundNavbarState createState() => UndergroundNavbarState();
}

class UndergroundNavbarState extends State<UndergroundNavbar> {
  final myKey = new GlobalKey<UndergroundNavbarState>();

  CupertinoTabController _controller;

  int _currentIndex = 0;

  double height = 19.35;

  Future<bool> onItemTapped(int index) async {
    if (index == _currentIndex) {
      switch (index) {
        case 0:
          mainKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 1:
          projectsKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 2:
          cardsKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 3:
          profileKey.currentState.popUntil((r) => r.isFirst);
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
                  navbarItem("Проекты", "projects", 1),
                  navbarItem("Карточки", "cards", 2),
                  navbarItem("Профиль", "profile", 3)
                ],
                onTap: onItemTapped,
              ),
              tabBuilder: (context, index) {
                CupertinoTabView currentPage;
                switch (index) {
                  case 0:
                    currentPage = CupertinoTabView(
                        navigatorKey: mainKey,
                        builder: (buildContext) => Profile());
                    break;
                  case 1:
                    currentPage = CupertinoTabView(
                        navigatorKey: projectsKey,
                        builder: (context) => MyProjects());
                    break;
                  case 2:
                    currentPage = CupertinoTabView(
                        navigatorKey: cardsKey, builder: (context) => Cards());
                    break;
                  case 3:
                    currentPage = CupertinoTabView(
                        navigatorKey: profileKey,
                        builder: (buildContext) => Profile());
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
