// To parse this JSON data, do
//
//     final afterRegister = afterRegisterFromJson(jsonString);

import 'dart:convert';

AfterRegister afterRegisterFromJson(String str) =>
    AfterRegister.fromJson(json.decode(str));

class AfterRegister {
  AfterRegister({
    this.email,
    this.username,
    this.id,
  });

  String email;
  String username;
  int id;

  factory AfterRegister.fromJson(Map<String, dynamic> json) => AfterRegister(
        email: json["email"],
        username: json["username"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "id": id,
      };
}
