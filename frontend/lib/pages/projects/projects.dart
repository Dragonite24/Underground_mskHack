import 'package:Underground/widgets.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class MyProjects extends StatefulWidget {
  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: Color(0xFFF0F0F0),

          ///  Страница скроллится для того, чтобы при разделении экрана на два
          /// (на андроиде), вёрстка не падала
          body: SingleChildScrollView(
              child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text('Проекты',
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 24,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().regular)),
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
          ))),
    );
  }

  Widget projectCard(String name, String descr, String url) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
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
                          fontSize: 18,
                          color: Color(0xFF333333))
                      .copyWith(fontFamily: Fonts().thin),
                )),
          ],
        ),
      );
}
