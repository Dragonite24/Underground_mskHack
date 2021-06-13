import 'dart:convert';

List<MyTeams> myTeamsFromJson(String str) => List<MyTeams>.from(json.decode(str).map((x) => MyTeams.fromJson(x)));

class MyTeams {
    MyTeams({
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

    factory MyTeams.fromJson(Map<String, dynamic> json) => MyTeams(
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
