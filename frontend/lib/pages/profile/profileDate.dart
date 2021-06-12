import 'package:Underground/code_input/src/verify_code_input_widget.dart';
import 'package:Underground/const.dart';
import 'package:Underground/pages/profile/menuItems/projects.dart';
import 'package:Underground/pages/signIn/success.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  Future<bool> onItemTapped(int index) async {
    if (index == _currentIndex) {
      switch (index) {
        case 0:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Project()));
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Project()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Project()));
          break;
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Project()));
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
          child: Scaffold(
              backgroundColor: Colors.green,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // основная колонка
                      children: [
                        SizedBox(height: 15),
                        CircleAvatar(
                          radius: 40,
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
                              .copyWith(fontFamily: Fonts().light),
                        ),
                        Text(
                          'Россия, Ярославль',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().light),
                        ),
                        Text(
                          '19 Февраля 2000',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().light),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
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
                                    text: '',
                                  ),
                                  TextSpan(
                                      text: '+7-905-630-22-80 qwez-9@mail.ru',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: Color(0xFF16FF00))),
                                ])),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // todo
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                color: Colors.red),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ))));

  Widget menuItem(String text) => Row(
        children: [
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => print('qwe'),
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
