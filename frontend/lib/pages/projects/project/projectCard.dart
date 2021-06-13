import 'package:flutter/material.dart';
import 'package:team_up/models/project.dart';
import 'package:team_up/models/projects.dart';

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
          return Padding(
              padding: const EdgeInsets.all(8.0), child: projectCard(index));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget projectCard(index) {}
}
