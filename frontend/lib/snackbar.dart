import 'package:flutter/material.dart';

class Snackbar {
  static void show(context) {
    var snackBar = SnackBar(
      content: Text('Что-то пошло не так'),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
