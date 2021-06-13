import 'package:flutter/material.dart';
import 'package:team_up/models/projects.dart';
import 'package:team_up/models/teams.dart';

import '../../../const.dart';
import '../../../http.dart';
import '../../../indicator.dart';
import '../../../widgets.dart';

// Проекты - Вкладка Команды
class TeamsItem extends StatefulWidget {
  const TeamsItem({Key key}) : super(key: key);

  @override
  _TeamsItemState createState() => _TeamsItemState();
}

class _TeamsItemState extends State<TeamsItem> {
  List<Teams> teams;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Teams>>(
      future: Http().getAllTeams(),
      builder: (BuildContext context, AsyncSnapshot<List<Teams>> snapshot) {
        if (snapshot.hasError) {
          return UndergroundNoConnection();
        } else if (snapshot.hasData) {
          teams = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: teams.length,
                itemBuilder: (BuildContext context, int index) =>
                    teamCard(index)),
          );
        } else {
          return Center(
            child: Indicator.circle,
          );
        }
      },
    );
  }

  Widget teamCard(index) => ClipRRect(
        child: Container(
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
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "images/profile/underground.jpg",
                      ),
                      radius: 45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      teams[index].name,
                      style: TextStyle(
                        fontFamily: Fonts().medium,
                        fontSize: 20,
                        color: black,
                      ),
                    ),
                  ),
                  Text(
                    teams[index].comp,
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
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      teams[index].name,
                      style: TextStyle(
                        fontFamily: Fonts().medium,
                        fontSize: 16,
                        color: black,
                      ),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing eleit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laborrris nisi ut aliquip ex ea commodo. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
      );
}
