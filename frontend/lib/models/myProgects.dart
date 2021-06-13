import 'dart:convert';

List<GetMyProjects> getMyProjectsFromJson(String str) =>
    List<GetMyProjects>.from(
        json.decode(str).map((x) => GetMyProjects.fromJson(x)));

class GetMyProjects {
  GetMyProjects({
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

  factory GetMyProjects.fromJson(Map<String, dynamic> json) => GetMyProjects(
        poster: json["poster"],
        name: json["name"],
        shortDesc: json["short_desc"],
        type: json["type"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "poster": poster,
        "name": name,
        "short_desc": shortDesc,
        "type": type,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "address": address,
      };
}
