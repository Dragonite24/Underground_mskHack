// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

List<Projects> projectFromJson(String str) =>
    List<Projects>.from(json.decode(str).map((x) => Projects.fromJson(x)));

String projectToJson(List<Projects> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Projects {
  Projects({
    this.id,
    this.about,
    this.team,
    this.product,
    this.branch,
    this.name,
    this.poster,
  });

  int id;
  About about;
  Team team;
  Product product;
  String branch;
  String name;
  dynamic poster;

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        id: json["id"] == null ? null : json["id"],
        about: json["about"] == null ? null : About.fromJson(json["about"]),
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        branch: json["branch"] == null ? null : json["branch"],
        name: json["name"] == null ? null : json["name"],
        poster: json["poster"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "about": about == null ? null : about.toJson(),
        "team": team == null ? null : team.toJson(),
        "product": product == null ? null : product.toJson(),
        "branch": branch == null ? null : branch,
        "name": name == null ? null : name,
        "poster": poster,
      };
}

class About {
  About({
    this.id,
    this.dateStart,
    this.exp,
    this.resources,
    this.current,
    this.model,
    this.plan,
  });

  int id;
  DateTime dateStart;
  String exp;
  String resources;
  String current;
  String model;
  String plan;

  factory About.fromJson(Map<String, dynamic> json) => About(
        id: json["id"] == null ? null : json["id"],
        dateStart: json["date_start"] == null
            ? null
            : DateTime.parse(json["date_start"]),
        exp: json["exp"] == null ? null : json["exp"],
        resources: json["resources"] == null ? null : json["resources"],
        current: json["current"] == null ? null : json["current"],
        model: json["model"] == null ? null : json["model"],
        plan: json["plan"] == null ? null : json["plan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "date_start": dateStart == null
            ? null
            : "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
        "exp": exp == null ? null : exp,
        "resources": resources == null ? null : resources,
        "current": current == null ? null : current,
        "model": model == null ? null : model,
        "plan": plan == null ? null : plan,
      };
}

class Product {
  Product({
    this.id,
    this.desc,
    this.advantage,
    this.stage,
  });

  int id;
  String desc;
  String advantage;
  String stage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        desc: json["desc"] == null ? null : json["desc"],
        advantage: json["advantage"] == null ? null : json["advantage"],
        stage: json["stage"] == null ? null : json["stage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "desc": desc == null ? null : desc,
        "advantage": advantage == null ? null : advantage,
        "stage": stage == null ? null : stage,
      };
}

class Team {
  Team({
    this.id,
    this.comp,
    this.name,
    this.desc,
    this.poster,
  });

  int id;
  String comp;
  String name;
  String desc;
  dynamic poster;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"] == null ? null : json["id"],
        comp: json["comp"] == null ? null : json["comp"],
        name: json["name"] == null ? null : json["name"],
        desc: json["desc"] == null ? null : json["desc"],
        poster: json["poster"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "comp": comp == null ? null : comp,
        "name": name == null ? null : name,
        "desc": desc == null ? null : desc,
        "poster": poster,
      };
}
