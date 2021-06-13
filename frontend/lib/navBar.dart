import 'package:team_up/pages/chat/chatlist.dart';
import 'package:team_up/pages/maps/maps.dart';
import 'package:team_up/pages/projects/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'pages/cards/searchmain.dart';
import 'pages/profile/profileDate.dart';

final GlobalKey<UndergroundNavbarState> navbarKey =
    GlobalKey<UndergroundNavbarState>();
final GlobalKey<NavigatorState> mapKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> projectsKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> cardsKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> chatKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> profileKey = GlobalKey<NavigatorState>();

class UndergroundNavbar extends StatefulWidget {
  final bool isFromSignUp;

  UndergroundNavbar({this.isFromSignUp = false}) : super(key: navbarKey);

  @override
  UndergroundNavbarState createState() => UndergroundNavbarState();
}

class UndergroundNavbarState extends State<UndergroundNavbar> {
  final myKey = new GlobalKey<UndergroundNavbarState>();

  CupertinoTabController _controller;

  int _currentIndex = 1;

  double height = 19.35;

  Future<bool> onItemTapped(int index) async {
    if (index == _currentIndex) {
      switch (index) {
        case 0:
          mapKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 1:
          projectsKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 2:
          cardsKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 3:
          chatKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 4:
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
                  navbarItem("Карты", "map", 0),
                  navbarItem("Лента", "project", 1),
                  navbarItem("Карточки", "doc", 2),
                  navbarItem("Чат", "chat", 3),
                  navbarItem("Профиль", "person", 4)
                ],
                onTap: onItemTapped,
              ),
              tabBuilder: (context, index) {
                CupertinoTabView currentPage;
                switch (index) {
                  case 0:
                    currentPage = CupertinoTabView(
                        navigatorKey: mapKey,
                        builder: (buildContext) => MapsView());
                    break;
                  case 1:
                    currentPage = CupertinoTabView(
                        navigatorKey: projectsKey,
                        builder: (context) => ProjectsItems());
                    break;
                  case 2:
                    currentPage = CupertinoTabView(
                        navigatorKey: cardsKey, builder: (context) => Cards());
                    break;
                  case 3:
                    currentPage = CupertinoTabView(
                        navigatorKey: chatKey,
                        builder: (context) => ChatList());
                    break;
                  case 4:
                    currentPage = CupertinoTabView(
                        navigatorKey: profileKey,
                        builder: (buildContext) => Profile());
                    break;
                }
                return currentPage;
              })));

  BottomNavigationBarItem navbarItem(String name, image, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        _currentIndex == index
            ? "images/navBar/${image}_active.svg"
            : "images/navBar/${image}_inactive.svg",
        height: 25,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: _currentIndex == index ? Color(0xFF333333) : null,
        ),
      ),
    );
  }
}
