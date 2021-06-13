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

  Widget eventInformation() {
    return UndergroundScaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 270,
                  child: Image.asset(
                    "images/backgrounds/buisness.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 80,
                  child: Container(
                    height: 60,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        // TODO Calendar
                      },
                      child: Icon(
                        Icons.calendar_today,
                        size: 23,
                        color: black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 15,
                  child: FloatingActionButton(
                    onPressed: () {
                      // TODO Notification
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF16FF00),
                            Color(0xFF4CFFC9),
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        size: 25,
                        color: black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: double.infinity,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                color: Colors.white,
                height: 540,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      event.name,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().medium),
                    ),
                    Text(
                      event.fullDesc,
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().thin),
                    ),
                    SizedBox(height: 20),
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
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().thin),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Контакты',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().light),
                    ),
                    Text(
                      event.contactEmail,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color(0xFF16FF00),
                      ).copyWith(fontFamily: Fonts().light),
                    ),
                    SizedBox(height: 5),
                    Text(
                      event.eventSite,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color(0xFF16FF00),
                      ).copyWith(fontFamily: Fonts().light),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Участники',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().medium),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          frendList('Веня'),
                          frendList('Семен'),
                          frendList('Оксана'),
                          frendList('Саня'),
                          frendList('Веня1'),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Полное описание мероприятия',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().light),
                    ),
                    SizedBox(height: 5),
                    Text(
                      event.fullDesc,
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF333333),
                      ).copyWith(fontFamily: Fonts().thin),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // TODO: Подать заявку
                        print("Wew");
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Подать заявку',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xFF333333),
                              ).copyWith(fontFamily: Fonts().light),
                            ),
                            decoration:
                                UndergroundOutlinedButton().kInnerDecoration,
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          decoration: UndergroundOutlinedButton()
                              .kGradientBoxDecoration,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container frendList(String name) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          InkWell(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 30,
              child: CircleAvatar(
                radius: 29,
                backgroundColor: Colors.red,
                backgroundImage: null,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: Color(0xFF333333),
            ).copyWith(fontFamily: Fonts().regular),
          ),
        ],
      ),
    );
  }
}
