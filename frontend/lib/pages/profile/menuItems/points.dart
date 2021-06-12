import 'package:flutter/material.dart';

import '../../../const.dart';

class Points extends StatefulWidget {
  const Points({Key key}) : super(key: key);

  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
              ),
              projectCard(
                  'Скидка до 10% в TelaViva в течение месяца!',
                  'Стоимость: 300 баллов',
                  'https://cdn5.zp.ru/job/attaches/2018/08/84/a9/84a905e003a615c706f0b6d657ce940e.jpg'),
              projectCard('Два', 'Описание',
                  'https://st4.depositphotos.com/1046751/23974/i/950/depositphotos_239743782-stock-photo-business-team-discussing-information-from.jpg')
            ],
          ),
        ),
      )),
    );
  }

  Widget projectCard(String name, String descr, String url) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 10.0),
                    blurRadius: 10.0,
                    color: Color(0x42000000),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("$url"),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                )),
            Positioned(
                bottom: 33,
                left: 15,
                child: Text(
                  name,
                  style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFF333333))
                      .copyWith(fontFamily: Fonts().regular),
                )),
            Positioned(
                bottom: 15,
                left: 15,
                child: Text(
                  descr,
                  style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF333333))
                      .copyWith(fontFamily: Fonts().thin),
                )),
          ],
        ),
      );
}
