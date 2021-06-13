import 'dart:convert';

List<UsersInfo> usersInfoFromJson(String str) =>
    List<UsersInfo>.from(json.decode(str).map((x) => UsersInfo.fromJson(x)));

class UsersInfo {
  UsersInfo({
    this.email,
    this.id,
    this.name,
    this.profilePicId, // ссылка на фотографию в интернете для Image.url()
  });
  String email;
  int id;
  String name;
  String profilePicId;

  factory UsersInfo.fromJson(Map<String, dynamic> json) => UsersInfo(
        email: json["email"],
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        profilePicId:
            json["profile_pic_id"] == null ? null : json["profile_pic_id"],
      );
}
