// To parse this JSON data, do
//
//     final getToken = getTokenFromJson(jsonString);

import 'dart:convert';

GetToken getTokenFromJson(String str) => GetToken.fromJson(json.decode(str));

String getTokenToJson(GetToken data) => json.encode(data.toJson());

class GetToken {
  GetToken({
    this.refresh,
    this.access,
  });

  String refresh;
  String access;

  factory GetToken.fromJson(Map<String, dynamic> json) => GetToken(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
