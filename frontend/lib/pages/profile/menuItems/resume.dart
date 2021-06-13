import 'package:flutter/material.dart';

import '../../../const.dart';

class Resume extends StatefulWidget {
  const Resume({Key key}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final styleLight = TextStyle(
    fontSize: 18,
    color: Color(0xFF333333),
  ).copyWith(fontFamily: Fonts().light);

  final styleMedium = TextStyle(
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
                style: styleMedium,
              ),
              Text(
                'Ваш опыт работы',
                style: styleLight,
              ),
              SizedBox(height: 20),
              Text(
                'Образование',
                style: styleMedium,
              ),
              Text(
                'Ваше образование',
                style: styleLight,
              ),
              SizedBox(height: 20),
              Text(
                'Soft Skills',
                style: styleMedium,
              ),
              Text(
                'Опыт работы',
                style: styleLight,
              ),
              SizedBox(height: 20),
              Text(
                'Hard Skills',
                style: styleMedium,
              ),
              Text(
                'Опыт работы',
                style: styleLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
