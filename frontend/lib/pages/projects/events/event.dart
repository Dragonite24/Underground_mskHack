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
          return eventInformation();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget eventInformation() => UndergroundScaffold(
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF16FF00),
                            Color(0xFF4CFFC9),
                          ],
                        ),
                      ),
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
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      event.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().medium),
                    ),
                    SizedBox(height: 5),
                    Text(
                      event.fullDesc,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().thin),
                    ),
                    SizedBox(height: 50),
                    Text(
                      event.date.toString(),
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().light),
                    ),
                    Text(
                      event.shortDesc.toString(),
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().thin),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Контакты',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().light),
                    ),
                    Text(event.contactEmail,
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Color(0xFF16FF00))
                            .copyWith(fontFamily: Fonts().light)),
                    SizedBox(height: 10),
                    Text(event.eventSite,
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Color(0xFF16FF00))
                            .copyWith(fontFamily: Fonts().light)),
                    SizedBox(height: 15),
                    Text('Участники',
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().medium)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          frendList(),
                          frendList(),
                          frendList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Container frendList() => Container(
      padding: EdgeInsets.only(right: 10),
      child: Column(children: [
        InkWell(
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                child: CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.red,
                  backgroundImage: null,
                )))
      ]));
}
