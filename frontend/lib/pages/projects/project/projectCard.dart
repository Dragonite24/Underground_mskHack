import 'package:flutter/material.dart';
import 'package:team_up/models/project.dart';
import 'package:team_up/models/projects.dart';

import '../../../const.dart';
import '../../../http.dart';
import '../../../widgets.dart';

class ProjectCard extends StatefulWidget {
  final int index;
  ProjectCard(this.index);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  int index;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  Project project;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Project>(
      future: Http().getCurrentProject(index),
      builder: (BuildContext context, AsyncSnapshot<Project> snapshot) {
        if (snapshot.hasError) {
          return UndergroundNoConnection();
        } else if (snapshot.hasData) {
          project = snapshot.data;
          return projectCard(project);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget projectCard(Project project) => UndergroundScaffold(
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      child: Image.asset(
                        "images/backgrounds/buisness.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  // Positioned(
                  //     bottom: 0,
                  //     child: Container(
                  //       height: 15,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(20),
                  //             topRight: Radius.circular(20)),
                  //         color: Colors.red,
                  //       ),
                  //     ))
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 40,
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 180,
                                    child: Text(
                                      project.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Color(0xFF333333),
                                      ).copyWith(fontFamily: Fonts().medium),
                                    ),
                                  ),
                                  Text(
                                    'Россия, Ярославль',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      color: Color(0xFF333333),
                                    ).copyWith(fontFamily: Fonts().light),
                                  ),
                                  Text(
                                    '+79056302280',
                                    style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: Color(0xFF16FF00))
                                        .copyWith(fontFamily: Fonts().light),
                                  ),
                                  Text(
                                    'qwez-9@mail.ru',
                                    style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                            color: Color(0xFF16FF00))
                                        .copyWith(fontFamily: Fonts().light),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: IconButton(
                                color: black,
                                onPressed: null,
                                icon: Icon(Icons.qr_code_rounded),
                                alignment: Alignment.topCenter,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              // Подать заявку
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Подать заявку',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(0xFF333333),
                                ).copyWith(fontFamily: Fonts().light),
                              ),
                              decoration:
                                  UndergroundOutlinedButton().kInnerDecoration,
                            ),
                          ),
                          decoration: UndergroundOutlinedButton()
                              .kGradientBoxDecoration,
                        ),
                      ),
                      Text(
                        'О команде',
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ).copyWith(fontFamily: Fonts().thin),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
