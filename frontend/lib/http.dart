import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:team_up/models/events.dart';
import 'package:team_up/models/token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'models/afterReg.dart';
import 'models/projects.dart';

class Http {
  final String url = "hollapuppy.pythonanywhere.com"; // api url

  Future<AfterRegister> register(String name, password, email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var body = json.encoder
        .convert({"username": name, "password": password, "email": email});
    final response = await http.post(
      Uri.http(url, "/api/auth/users/"),
      body: body,
      headers: {'Content-type': 'application/json'},
    );
    AfterRegister model;
    if (response.statusCode < 300) {
      model = afterRegisterFromJson(response.body);
      preferences.setString('username', name);
      preferences.setString('password', password);
      log('Register STATUS CODE: ' + response.statusCode.toString());
      return model;
    } else {
      log('Register STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return model;
    }
  }

  Future<GetToken> getToken(String username, password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var body = json.encoder
        .convert({"username": "$username", "password": "$password"});
    final response = await http.post(
      Uri.http(url, "/api/token/"),
      body: body,
      headers: {'Content-type': 'application/json'},
    );
    GetToken token;
    if (response.statusCode < 300) {
      log('getToken STATUS CODE: ' + response.statusCode.toString());
      token = getTokenFromJson(response.body);

      preferences.setString('username', username);
      preferences.setString('password', password);
      preferences.setString('token_access', token.access);
      preferences.setString('token_refresh', token.refresh);
      return token;
    } else {
      log('getToken STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return token;
    }
  }

  Future<String> refreshToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token_refresh');
    var body = json.encoder.convert({"refresh": token});
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.http(url, "/api/token/refresh/"),
      body: body,
      headers: headers,
    );
    dynamic new_token;
    if (response.statusCode < 300) {
      log('refreshToken STATUS CODE: ' + response.statusCode.toString());
      new_token = jsonDecode(response.body);
      preferences.setString('token_acces', new_token.access);
      return new_token.access;
    } else {
      log('refreshToken STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return '';
    }
  }

  Future<bool> newIndivid(String username, email, id) async {
    var body =
        json.encoder.convert({"FIO": username, "email": email, "user": id});
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token_access');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.http(url, "/api/individual/new"),
      body: body,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      log('newIndivid pass');
      log(response.body);
      return true;
    } else {
      log('newIndivid STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return false;
    }
  }

  Future<List<Projects>> getListProjects() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token_access');
    final username = preferences.getString('username');
    final password = preferences.getString('password');
    final response = await http.get(
      Uri.http(url, "/api/project/all"),
      headers: {
        "Authorization": "Bearer $token",
        "username": username,
        "password": password
      },
    );
    var proj;
    if (response.statusCode < 300) {
      proj = projectFromJson(response.body);
      log('getmyProjects pass');
      return proj;
    } else {
      log('getmyProjects STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      throw ('getmyProjects STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<Projects> getCurrentProject() async {
    //await refreshToken();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token_access');
    final username = preferences.getString('username');
    final password = preferences.getString('password');
    final response = await http.get(
      Uri.http(url, "/api/project/all"),
      headers: {
        "Authorization": "Bearer $token",
        "username": username,
        "password": password
      },
    );
    var proj;
    if (response.statusCode < 300) {
      print(response.body);
      log('getmyProjects pass');
      return proj;
    } else {
      log('getmyProjects STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      throw ('getmyProjects STATUS CODE: ' + response.statusCode.toString());
    }
  }

  Future<List<EventsList>> getEvents() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token_access');
    final username = preferences.getString('username');
    final password = preferences.getString('password');
    final response = await http.get(
      Uri.http(url, "/api/event/all"),
      headers: {
        "Authorization": "Bearer $token",
        "username": username,
        "password": password
      },
    );
    var events;
    if (response.statusCode < 300) {
      events = eventFromJson(response.body);
      log('getmyProjects pass');
      return events;
    } else {
      log('getmyProjects STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      throw ('getmyProjects STATUS CODE: ' + response.statusCode.toString());
    }
  }

  static Future<EventsList> getEvent(int eventId) async {
    switch (eventId) {
      case 1:
        return EventsList(
          name: "Регулярная игра в Межвузовском клубе интеллектуальных игр",
          shortDesc: "Томск, Точка кипения ТУСУР Томск",
          date: new DateTime(2021, 06, 13, 14, 30),
          address: "Томск, ул Красноармейская, д. 147",
        );
        break;
      case 2:
        return EventsList(
          name: "Английский с нуля",
          shortDesc: "Калуга, Точка кипения - Калуга",
          date: new DateTime(2021, 06, 13, 15, 00),
          address: "Калуга, ул Октябрьская, д. 17А",
        );
        break;
      case 3:
        return EventsList(
          name: "Мастер-класс по голосо-речевой практике",
          shortDesc: "Хабаровск, Точка кипения - Хабаровск",
          date: new DateTime(2021, 06, 13, 15, 00),
          address: "Хабаровск, ул Муравьева-Амурского, д. 33",
        );
        break;
      default:
        throw Exception("Ivalid event id");
        break;
    }
  }
}
