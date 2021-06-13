// To parse this JSON data, do
//
//     final getMyProjects = getMyProjectsFromJson(jsonString);

import 'dart:convert';

GetMyProjects getMyProjectsFromJson(String str) =>
    GetMyProjects.fromJson(json.decode(str));

class GetMyProjects {
  GetMyProjects({
    this.id,
    this.poster,
    this.name,
    this.shortDesc,
    this.type,
    this.date,
    this.time,
    this.fullDesc,
    this.address,
    this.contactEmail,
    this.eventSite,
    this.team,
  });

  int id;
  dynamic poster;
  String name;
  String shortDesc;
  String type;
  DateTime date;
  String time;
  String fullDesc;
  String address;
  String contactEmail;
  String eventSite;
  dynamic team;

  factory GetMyProjects.fromJson(Map<String, dynamic> json) => GetMyProjects(
        id: json["id"],
        poster: json["poster"],
        name: json["name"],
        shortDesc: json["short_desc"],
        type: json["type"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        fullDesc: json["full_desc"],
        address: json["address"],
        contactEmail: json["contact_email"],
        eventSite: json["event_site"],
        team: json["team"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poster": poster,
        "name": name,
        "short_desc": shortDesc,
        "type": type,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "full_desc": fullDesc,
        "address": address,
        "contact_email": contactEmail,
        "event_site": eventSite,
        "team": team,
      };
}
