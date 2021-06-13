import 'package:flutter/material.dart';
import 'package:team_up/const.dart';
import 'package:team_up/http.dart';
import 'package:team_up/models/event.dart';
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                for (int eventId in snapshot.data) EventCard(eventId: eventId)
              ],
            ),
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

class EventCard extends StatefulWidget {
  const EventCard({Key key, this.eventId}) : super(key: key);

  final int eventId;

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Event>(
      future: Http.getEvent(widget.eventId),
      builder: (context, snapshot) {
        Widget child;
        if (snapshot.hasData) {
          child = Column(
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
              SizedBox(
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
                        snapshot.data.name,
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
                        snapshot.data.shortDesc,
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
