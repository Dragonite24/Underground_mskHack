import 'package:Underground/widgets.dart';
import 'package:flutter/material.dart';

class MyProjects extends StatefulWidget {
  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: Color(0xFFE5E5E5),

          ///  Страница скроллится для того, чтобы при разделении экрана на два
          /// (на андроиде), вёрстка не падала
          body: SingleChildScrollView(
              child: SafeArea(
            child: Container(),
          ))),
    );
  }
}
