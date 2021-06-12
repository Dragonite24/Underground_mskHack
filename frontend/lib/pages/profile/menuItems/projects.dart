import 'package:flutter/material.dart';

import '../../../const.dart';

class Project extends StatefulWidget {
  const Project({Key key}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
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
              projectCard('Один', 'Описание',
                  'https://cdn5.zp.ru/job/attaches/2018/08/84/a9/84a905e003a615c706f0b6d657ce940e.jpg'),
              projectCard('Два', 'Описание',
                  'https://st4.depositphotos.com/1046751/23974/i/950/depositphotos_239743782-stock-photo-business-team-discussing-information-from.jpg'),
              projectCard('Три', 'Описание',
                  'https://hub.ldpr.ru/media/images/yaroslavl/8817f6a0da39bcf571073e34a03db69ea91d1bd586718309a8fcab499f67dc01.jpg'),
              projectCard('Четыре', 'Описание',
                  'https://terve.su/wp-content/uploads/2018/08/kak-prestat-speshit-i-nachat-rabotat-1.jpg'),
            ],
          ),
        ),
      )),
    );
  }

  Widget projectCard(String name, String descr, String url) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 250,
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
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                )),
            Positioned(
                bottom: 65,
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
                bottom: 45,
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
