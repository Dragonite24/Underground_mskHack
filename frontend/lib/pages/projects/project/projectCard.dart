import 'package:flutter/material.dart';
import 'package:team_up/models/project.dart';
import 'package:team_up/models/projects.dart';

import '../../../const.dart';
import '../../../http.dart';
import '../../../snackbar.dart';
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
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.95,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'images/profile/underground.jpg',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  '????????????, ??????????????????',
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
                          onTap: () async {
                            loginAction().then((value) => Snackbar.show(
                                context, '??????????????!. ???????????????? ??????????????????????????'));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '???????????? ????????????',
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
                        decoration:
                            UndergroundOutlinedButton().kGradientBoxDecoration,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '?? ??????????????',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().medium),
                    ),
                    Text(
                      project.about.plan.toString(),
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().light),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '??????????',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().medium),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ClipRRect(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        color: Colors.black,
                                        width: 90,
                                        height: 90,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        project.name,
                                        style: TextStyle(
                                          fontFamily: Fonts().medium,
                                          fontSize: 20,
                                          color: black,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        project.about.plan.toString(),
                                        style: TextStyle(
                                          fontFamily: Fonts().medium,
                                          fontSize: 12,
                                          color: black.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "+7(905)630-22-80, qwez-9@mail.ru",
                                      style: TextStyle(
                                        fontFamily: Fonts().medium,
                                        fontSize: 12,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 6),
                                      child: Text(
                                        "?????? ??????",
                                        style: TextStyle(
                                          fontFamily: Fonts().medium,
                                          fontSize: 16,
                                          color: black,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      project.product.desc.toString(),
                                      style: TextStyle(
                                        fontFamily: Fonts().regular,
                                        fontSize: 14,
                                        color: black.withOpacity(0.6),
                                      ),
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  Future<bool> loginAction() async {
    await new Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
