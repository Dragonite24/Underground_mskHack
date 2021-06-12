import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:Underground/models/token.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/afterReg.dart';

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

  Future<GetToken> getToken(String password, username) async {
    var body =
        json.encoder.convert({"password": password, "username": username});
    final response = await http.post(
      Uri.http(url, "/api/token/"),
      body: body,
      headers: {'Content-type': 'application/json'},
    );
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

  Future<bool> login(String username, email, id) async {
    var body =
        json.encoder.convert({"FIO": username, "email": email, "user": id});
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.http(url, "/api/individ/new"),
      body: body,
      headers: headers,
    );
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
}
