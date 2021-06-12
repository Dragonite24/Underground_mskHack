import 'package:Underground/code_input/src/verify_code_input_widget.dart';
import 'package:Underground/const.dart';
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
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // основная колонка
                        children: [
                          Row(
                            // Аватар, фио, настройки
                            children: [
                              CircleAvatar(
                                radius: 40,
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 190,
                                      child: Text(
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
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                child: IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.settings)),
                              )
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Container(
                            child: Text(
                              'Друзья',
                              style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF333333))
                                  .copyWith(fontFamily: Fonts().light),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: <Widget>[
                                frendList(),
                                frendList(),
                                frendList(),
                                frendList(),
                                frendList(),
                                frendList(),
                              ])),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Container(
                            child: Text(
                              'О себе',
                              style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF333333))
                                  .copyWith(fontFamily: Fonts().light),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.15),
                          Container(
                            child: Text(
                              'Проекты',
                              style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Color(0xFF333333))
                                  .copyWith(fontFamily: Fonts().light),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: <Widget>[
                              projectList(),
                              projectList(),
                              projectList(),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))));
  Container frendList() => Container(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.red,
                    backgroundImage: /*todo [i].img*/ null),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Толясик\nпивасик',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      );
  Container projectList() => Container(
        width: 150,
        height: 110,
        padding: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 70,
            ),
            Container(
              color: Colors.green,
              height: 40,
            ),
          ],
        ),
      );
}
