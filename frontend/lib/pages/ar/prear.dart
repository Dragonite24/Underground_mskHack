import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:team_up/pages/ar/ar.dart';

class PreArView extends StatefulWidget {
  const PreArView({Key key}) : super(key: key);

  @override
  _PreArViewState createState() => _PreArViewState();
}

class _PreArViewState extends State<PreArView> {
  Future<void> load() async {
    if (await Permission.camera.request().isGranted) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => ArView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    load();
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          "Открытие вида",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
