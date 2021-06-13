import 'package:team_up/pages/projects/events.dart';
import 'package:team_up/pages/projects/peoples.dart';
import 'package:team_up/pages/projects/project/projects.dart';
import 'package:team_up/pages/projects/teams.dart';
import 'package:team_up/widgets.dart';
import 'package:flutter/material.dart';

// Контроллер верхней навигационной вкладки Проекты
class ProjectsItems extends StatefulWidget {
  const ProjectsItems({Key key}) : super(key: key);

  @override
  _ProjectsItemsState createState() => _ProjectsItemsState();
}

class _ProjectsItemsState extends State<ProjectsItems> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF8F8F8),
          elevation: 0,
          bottom: PreferredSize(
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.4),
              // indicator: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [Colors.black, Colors.redAccent],
              //   ),
              //   border: Border(
              //     bottom: BorderSide(
              //       width: 3,
              //       style: BorderStyle.solid,
              //       color: Colors.red,
              //     ),
              //   ),
              // ),
              indicatorColor: green,
              tabs: [
                Tab(
                  child: Text(
                    'Проекты',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Команды',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Люди',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'События',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(0.0),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MyProjects(),
            Teams(),
            Poples(),
            Events(),
          ],
        ),
      ),
    );
  }
}
