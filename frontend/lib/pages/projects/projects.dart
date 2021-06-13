import 'package:flutter/material.dart';
import 'package:team_up/indicator.dart';
import 'package:team_up/models/myProgects.dart';

import '../../const.dart';
import '../../http.dart';

// Проекты - Вкладка Проекты
class MyProjects extends StatefulWidget {
  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  bool isLoading = true;
  List<GetMyProjects> projects;

  @override
  void initState() {
    Http().getMyProjects().then((value) {
      if (value != null) {
        setState(() {
          projects = value;
          print(projects);
        });
      } else {
        var snackBar = SnackBar(content: Text("Что-то пошло не так"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: isLoading
          ? Indicator.circle
          : Scaffold(
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
                      ),
                      ListView.builder(
                          itemCount: projects.length,
                          itemBuilder: (BuildContext context, int index) =>
                              projectCard(index)),
                    ],
                  ),
                ),
              ))),
    );
  }

  Column projectTile(int index) => Column(
        children: [
          SizedBox(height: 20),
          Container(
              height: 67,
              padding:
                  EdgeInsets.only(top: 13, bottom: 14, left: 20, right: 17),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Row(children: [
                  projects[index].name != null
                      ? RichText(
                          text: TextSpan(children: [
                          TextSpan(
                              text: '+${projects[index].date.toString()}',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.red)),
                          TextSpan(
                              text: "балла",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.red)),
                        ]))
                      : Text("В обработке",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.red)),
                ]),
              ])),
          SizedBox(height: 26),
          Container(height: 1, width: double.infinity, color: Color(0xffEAEFF3))
        ],
      );

  Widget projectCard(index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  //image: NetworkImage("$url"),
                  image: null,
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
                bottom: 33,
                left: 15,
                child: Text(
                  projects[index].name,
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
                  projects[index].shortDesc,
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
