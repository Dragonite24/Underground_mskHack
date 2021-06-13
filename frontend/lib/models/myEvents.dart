// To parse this JSON data, do
//
//     final myEvents = myEventsFromJson(jsonString);

import 'dart:convert';

List<Event> myEventsFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String myEventsToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    this.poster,
    this.name,
    this.shortDesc,
    this.type,
    this.date,
    this.time,
    this.address,
  });

  dynamic poster;
  String name;
  String shortDesc;
  String type;
  DateTime date;
  String time;
  String address;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        poster: json["poster"],
        name: json["name"] == null ? null : json["name"],
        shortDesc: json["short_desc"] == null ? null : json["short_desc"],
        type: json["type"] == null ? null : json["type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"] == null ? null : json["time"],
        address: json["address"] == null ? null : json["address"],
      );

  Map<String, dynamic> toJson() => {
        "poster": poster,
        "name": name == null ? null : name,
        "short_desc": shortDesc == null ? null : shortDesc,
        "type": type == null ? null : type,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time == null ? null : time,
        "address": address == null ? null : address,
      };
}
