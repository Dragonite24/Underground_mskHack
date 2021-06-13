import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

class Event {
  Event({
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
  List<dynamic> team;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"] == null ? null : json["id"],
        poster: json["poster"],
        name: json["name"] == null ? null : json["name"],
        shortDesc: json["short_desc"] == null ? null : json["short_desc"],
        type: json["type"] == null ? null : json["type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"] == null ? null : json["time"],
        fullDesc: json["full_desc"] == null ? null : json["full_desc"],
        address: json["address"] == null ? null : json["address"],
        contactEmail:
            json["contact_email"] == null ? null : json["contact_email"],
        eventSite: json["event_site"] == null ? null : json["event_site"],
        team: json["team"] == null
            ? null
            : List<dynamic>.from(json["team"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "poster": poster,
        "name": name == null ? null : name,
        "short_desc": shortDesc == null ? null : shortDesc,
        "type": type == null ? null : type,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time == null ? null : time,
        "full_desc": fullDesc == null ? null : fullDesc,
        "address": address == null ? null : address,
        "contact_email": contactEmail == null ? null : contactEmail,
        "event_site": eventSite == null ? null : eventSite,
        "team": team == null ? null : List<dynamic>.from(team.map((x) => x)),
      };
}
