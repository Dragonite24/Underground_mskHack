import 'package:flutter/material.dart';

class Indicator {
  static Widget circle = Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Colors.indigo,
          )
      )
  );
}