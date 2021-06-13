import 'package:flutter/material.dart';
import 'package:team_up/indicator.dart';
import 'package:team_up/models/projects.dart';
import 'package:team_up/pages/profile/menuItems/projects.dart';
import 'package:team_up/pages/projects/project/projectCard.dart';

import '../../../const.dart';
import '../../../http.dart';
import '../../../widgets.dart';

// Проекты - Вкладка Проекты
class MyProjects extends StatefulWidget {
  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  List<Projects> projects;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Projects>>(
      future: Http().getListProjects(),
      builder: (BuildContext context, AsyncSnapshot<List<Projects>> snapshot) {
        if (snapshot.hasError) {
          return UndergroundNoConnection();
        } else if (snapshot.hasData) {
          projects = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) =>
                    projectCard(index)),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget projectCard(index) => GestureDetector(
        onTap: () => Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => ProjectCard())),
        child: Column(
          children: [
            SizedBox(
              height: 211,
              width: double.infinity,
              child: Container(
                child: Image.asset(
                  "images/backgrounds/buisness.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 121,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      projects[index].name,
                      style: TextStyle(
                        fontFamily: Fonts().medium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 12,
                      top: 6,
                    ),
                    child: Text(
                      projects[index].team.desc.toString(),
                      style: TextStyle(
                        fontFamily: Fonts().regular,
                        fontSize: 14,
                        color: black.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
