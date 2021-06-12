import 'package:Underground/pages/projects/projects.dart';
import 'package:Underground/widgets.dart';
import 'package:flutter/material.dart';

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
            preferredSize: Size.fromHeight(30.0),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.notifications, color: Colors.black),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: MyProjects(),
            ),
            Container(
              child: Center(
                child: Text('Tab 3'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 3'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
