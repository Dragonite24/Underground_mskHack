import 'package:flutter/material.dart';
import 'package:team_up/widgets.dart';

import '../../const.dart';

class Resourses extends StatefulWidget {
  const Resourses({Key key}) : super(key: key);

  @override
  _ResoursesState createState() => _ResoursesState();
}

class _ResoursesState extends State<Resourses> {
  @override
  Widget build(BuildContext context) {
    return UndergroundScaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text('Ресурсы',
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().medium)),
                  Text('           '),
                ],
              ),
            ),
            resButton('', 1),
            resButton('', 2),
            resButton('', 3),
            resButton('', 4),
          ],
        ),
      ),
    );
  }

  Widget resButton(String url, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: double.infinity,
            height: 120,
            child: Image.asset('images/backgrounds/res_$index.png'),
          ),
        ),
      );
}
