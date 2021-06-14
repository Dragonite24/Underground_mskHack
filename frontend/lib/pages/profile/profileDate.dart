import 'package:team_up/const.dart';
import 'package:team_up/pages/profile/menuItems/points.dart';
import 'package:team_up/pages/profile/menuItems/projects.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart';
import 'menuItems/notifications.dart';
import 'menuItems/resume.dart';
import 'menuItems/teams.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  //int _currentIndex = 0;
  int _widgetIndex = 0;

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // основная колонка
                      children: [
                        Container(
                            height: 120,
                            width: double.infinity,
                            child: Image.asset(
                              'images/backgrounds/topbg1.png',
                              fit: BoxFit.fitWidth,
                            )),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Notifications())),
                                    child: Stack(
                                      children: [
                                        Icon(
                                          Icons.notifications_rounded,
                                          size: 25,
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: ClipRRect(
                                            child: Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                  color: green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          'images/profile/erik.jpg',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Колесников Семен',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                color: Color(0xFF333333))
                                            .copyWith(
                                                fontFamily: Fonts().light),
                                      ),
                                      Text(
                                        'Россия, Ярославль',
                                        style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Color(0xFF333333))
                                            .copyWith(
                                                fontFamily: Fonts().light),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Color(0xFF333333)),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        '+7(905)630-22-80 qwez-9@mail.ru',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF16FF00))),
                                              ])),
                                    ],
                                  ),
                                  Icon(null),
                                ],
                              ),
                              SizedBox(height: 15),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal, // todo
                                child: Row(
                                  children: [
                                    menuItem('Резюме', 0),
                                    menuItem('Проекты', 1),
                                    menuItem('Команда', 2),
                                    menuItem('Баллы', 3),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              IndexedStack(
                                index: _widgetIndex,
                                children: [
                                  Resume(),
                                  ProjectItem(),
                                  Teams(),
                                  Points(),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))));

  Widget menuItem(String text, int id) => Row(
        children: [
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() => _widgetIndex = id);
            },
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(text),
                decoration: UndergroundOutlinedButton().kInnerDecoration,
              ),
              width: 90,
              height: 30,
              decoration: UndergroundOutlinedButton().kGradientBoxDecoration,
            ),
          ),
          SizedBox(width: 5),
        ],
      );
  Widget menuActiveItem(String text, int id) => Row(
        children: [
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() => _widgetIndex = id);
            },
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(text),
                decoration: UndergroundOutlinedButton().kInnerDecoration,
              ),
              width: 90,
              height: 30,
              decoration: UndergroundOutlinedButton().kGradientBoxDecoration,
            ),
          ),
          SizedBox(width: 5),
        ],
      );
}
