import 'package:flutter/material.dart';

class Points extends StatefulWidget {
  const Points({Key key}) : super(key: key);

  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
    );
  }
}
