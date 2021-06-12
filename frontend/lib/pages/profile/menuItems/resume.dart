import 'package:flutter/material.dart';

import '../../../const.dart';

class Resume extends StatefulWidget {
  const Resume({Key key}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final style_light = TextStyle(
    fontSize: 18,
    color: Color(0xFF333333),
  ).copyWith(fontFamily: Fonts().light);

  final style_medium = TextStyle(
    fontSize: 18,
    color: Color(0xFF333333),
  ).copyWith(fontFamily: Fonts().medium);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Опыт работы',
                style: style_medium,
              ),
              Text(
                'Ваш опыт работы',
                style: style_light,
              ),
              SizedBox(height: 20),
              Text(
                'Образование',
                style: style_medium,
              ),
              Text(
                'Ваше образование',
                style: style_light,
              ),
              SizedBox(height: 20),
              Text(
                'Soft Skills',
                style: style_medium,
              ),
              Text(
                'Опыт работы',
                style: style_light,
              ),
              SizedBox(height: 20),
              Text(
                'Hard Skills',
                style: style_medium,
              ),
              Text(
                'Опыт работы',
                style: style_light,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
