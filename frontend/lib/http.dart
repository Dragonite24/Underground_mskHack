import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

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

  Future<bool> register2(String name, id, email) async {
    var body = json.encoder.convert({"FIO": name, "email": email, "user": id});
    final response = await http.post(
      Uri.http(url, "/api/individ/new"),
      body: body,
      headers: {'Content-type': 'application/json'},
    );
    print(body);
    if (response.statusCode < 300) {
      log('Register STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return true;
    } else {
      log('Register STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return false;
    }
  }

  Future<bool> login(String name, password) async {
    var body = json.encoder.convert({"username": name, "password": password});
    final response = await http.post(
      Uri.http(url, "api/token"),
      body: body,
      headers: {'Content-type': 'application/json'},
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
