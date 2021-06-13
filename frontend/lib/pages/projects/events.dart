import 'package:flutter/material.dart';
import 'package:team_up/http.dart';
import 'package:team_up/widgets.dart';

// Проекты - Вкладка События
class Events extends StatefulWidget {
  const Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: Http.getEvents(),
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        if (snapshot.hasError) {
          return UndergroundNoConnection();
        } else if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data.toString()),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
