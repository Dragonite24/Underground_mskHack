import 'package:flutter/material.dart';

class Snackbar {
  static void show(context, String text) {
    var snackBar = SnackBar(
      content: text == null ? Text('Что-то пошло не так') : Text(text),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
