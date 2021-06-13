import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:team_up/models/event.dart';

import '../../../const.dart';
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
                  Positioned(
                    bottom: 15,
                    right: 80,
                    child: Container(
                      height: 46,
                      child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: null,
                          child: Icon(
                            Icons.perm_contact_calendar_rounded,
                            size: 23,
                            color: black,
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Container(
                      height: 46,
                      child: FloatingActionButton(
                          backgroundColor: green,
                          onPressed: null,
                          child: Icon(
                            Icons.notifications_active,
                            size: 23,
                            color: black,
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                height: 500,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Колесников Семен',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().light),
                    ),
                    Text(
                      'Россия, Ярославль',
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().light),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF333333)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '+7(905)630-22-80 qwez-9@mail.ru',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Color(0xFF16FF00))),
                            ])),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
