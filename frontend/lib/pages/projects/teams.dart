import 'package:flutter/material.dart';
import 'package:team_up/const.dart';
import 'package:team_up/widgets.dart';

// Проекты - Вкладка Команды
class Teams extends StatefulWidget {
  const Teams({Key key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          TeamCard(),
          TeamCard(),
          TeamCard(),
        ],
      ),
    );
  }
}

class TeamCard extends StatefulWidget {
  const TeamCard({Key key}) : super(key: key);

  @override
  _TeamCardState createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: (() async => true)(),
      builder: (context, snapshot) {
        Widget child;
        if (snapshot.hasData) {
          child = Padding(
            padding: const EdgeInsets.all(16.0),
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
                        "UnderGround",
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
                        "Описание описание описание",
                        style: TextStyle(
                          fontFamily: Fonts().medium,
                          fontSize: 12,
                          color: black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Text(
                      "+7 (920) 123 45-67, example@mail.com",
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
                        "О нас",
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
          );
        } else if (snapshot.hasError) {
          child = Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Нет соединения"),
          );
        } else {
          child = Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Нет соединения"),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ClipRRect(
              child: child,
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
        );
      },
    );
  }
}
