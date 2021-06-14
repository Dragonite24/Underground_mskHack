import 'package:flutter/material.dart';
import 'package:team_up/widgets.dart';

import '../../../const.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return UndergroundScaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFF8F8F8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                Text('Уведомления',
                    style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF333333))
                        .copyWith(fontFamily: Fonts().medium)),
                Icon(null),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                color: Colors.black,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Relife',
                                  style: TextStyle(
                                    fontFamily: Fonts().medium,
                                    fontSize: 20,
                                    color: black,
                                  ),
                                ),
                                Text(
                                  'Вас приглашают в проект',
                                  style: TextStyle(
                                    fontFamily: Fonts().medium,
                                    fontSize: 14,
                                    color: black.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                menuItem('Принять'),
                                menuItem('Отклонить'),
                              ],
                            )),
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('images/profile/brand1.jpg', width: 100),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'UnderGround',
                                style: TextStyle(
                                  fontFamily: Fonts().medium,
                                  fontSize: 16,
                                  color: black,
                                ),
                              ),
                              Text(
                                '15.06.21 \nСостоится мероприятие на тему\n"Тестирование прототипа"',
                                style: TextStyle(
                                  fontFamily: Fonts().medium,
                                  fontSize: 14,
                                  color: black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(String text) => Row(
        children: [
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(text),
                decoration: UndergroundOutlinedButton().kInnerDecoration,
              ),
              width: 110,
              height: 30,
              decoration: UndergroundOutlinedButton().kGradientBoxDecoration,
            ),
          ),
          SizedBox(width: 5),
        ],
      );
}
