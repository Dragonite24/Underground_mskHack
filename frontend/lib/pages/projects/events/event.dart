import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:team_up/models/event.dart';

import '../../../http.dart';
import '../../../widgets.dart';

class EventCard extends StatefulWidget {
  int index;
  EventCard(this.index);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  int index;
  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  Event event;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Event>(
      future: Http().getCurrentEvents(index),
      builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
        if (snapshot.hasError) {
          return UndergroundNoConnection();
        } else if (snapshot.hasData) {
          event = snapshot.data;
          return eventInformation(index);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget eventInformation(index) => UndergroundScaffold(
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    child: Image.asset(
                      "images/backgrounds/buisness.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: null,
                      child: Icon(
                        Icons.perm_contact_calendar_rounded,
                        size: 23,
                        color: black,
                      ))
                ],
              ),
              Container(
                height: 500,
                color: Colors.yellow,
              ),
              Container(
                height: 500,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      );
}
