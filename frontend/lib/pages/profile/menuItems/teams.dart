import 'package:flutter/material.dart';

import '../../../const.dart';

class Teams extends StatefulWidget {
  const Teams({Key key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 6.0),
            blurRadius: 10.0,
            color: Color(0x42000000),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5,
            child: CircleAvatar(
              radius: 40,
            ),
          ),
          Positioned(
            top: 90,
            child: Text(
              'UnderGround',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF333333))
                  .copyWith(fontFamily: Fonts().light),
            ),
          ),
          Positioned(
            top: 115,
            child: Text(
              'Описание описание описание описание',
              style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF333333))
                  .copyWith(fontFamily: Fonts().light),
            ),
          ),
          Positioned(
            top: 130,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF333333)),
                    children: <TextSpan>[
                      TextSpan(
                          text: '+7(905)630-22-80 qwez-9@mail.ru',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Color(0xFF16FF00))),
                    ])),
          ),
          Positioned(
              top: 160,
              left: 20,
              child: Text(
                'О нас',
                style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF333333))
                    .copyWith(fontFamily: Fonts().medium),
              )),
          Positioned(
              top: 180,
              left: 20,
              child: Text(
                'Описание Описание Описание Описание\nВсем привет!!!)',
                style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF333333))
                    .copyWith(fontFamily: Fonts().thin),
              )),
        ],
      ),
    );
  }
}

/**
                        
 */