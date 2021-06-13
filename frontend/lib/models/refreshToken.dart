import 'dart:convert';

RefreshToken refreshTokenFromJson(String str) =>
    RefreshToken.fromJson(json.decode(str));

class RefreshToken {
  RefreshToken({
    this.access,
  });

  String access;

  factory RefreshToken.fromJson(Map<String, dynamic> json) => RefreshToken(
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
      };
}
