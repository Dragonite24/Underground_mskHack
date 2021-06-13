import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:team_up/models/token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'models/afterReg.dart';
import 'models/myProgects.dart';

class Http {
  final String url = "hollapuppy.pythonanywhere.com"; // api url

  Future<AfterRegister> register(String name, password, email) async {
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
      log('Register STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return model;
    } else {
      log('Register STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return model;
    }
  }

  Future<GetToken> getToken(String username, password) async {
    var body =
        json.encoder.convert({"username": username, "password": password});
    final response = await http.post(
      Uri.http(url, "/api/token/"),
      body: body,
      headers: {'Content-type': 'application/json'},
    );
    print(body);
    GetToken token;
    if (response.statusCode < 300) {
      log('getToken STATUS CODE: ' + response.statusCode.toString());
      token = getTokenFromJson(response.body);
      return token;
    } else {
      log('getToken STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return token;
    }
  }

  Future<bool> newIndivid(String username, email, id) async {
    var body =
        json.encoder.convert({"FIO": username, "email": email, "user": id});
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
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
      log('Login STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return true;
    } else {
      log('Login STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return false;
    }
  }

  Future<List<GetMyProjects>> getMyProjects() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final response = await http.get(
      Uri.http(url, "/api/project/all"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode < 300) {
      List<GetMyProjects> proj = getMyProjectsFromJson(response.body);
      return proj;
    } else {
      log('getmyProjects STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      throw ('getmyProjects STATUS CODE: ' + response.statusCode.toString());
    }
  }
}
