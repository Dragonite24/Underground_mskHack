import 'package:flutter/material.dart';
import 'package:team_up/const.dart';
import 'package:team_up/http.dart';
import 'package:team_up/models/events.dart';
import 'package:team_up/pages/projects/events/event.dart';
import 'package:team_up/widgets.dart';

// Проекты - Вкладка События
class Events extends StatefulWidget {
  const Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<EventsList> events;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EventsList>>(
      future: Http().getListEvents(),
      builder:
          (BuildContext context, AsyncSnapshot<List<EventsList>> snapshot) {
        if (snapshot.hasError) {
          return UndergroundNoConnection();
        } else if (snapshot.hasData) {
          events = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index) =>
                    eventCard(index)),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget eventCard(index) => GestureDetector(
        onTap: () => Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => EventCard(index))),
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
              height: 121,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 1.0),
                    blurRadius: 10.0,
                    color: Color(0x69000000),
                  )
                ],
              ),
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
                      events[index].name,
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
                      events[index].shortDesc.toString(),
                      style: TextStyle(
                        fontFamily: Fonts().regular,
                        fontSize: 14,
                        color: black.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
