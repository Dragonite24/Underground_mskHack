import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PreArView extends StatefulWidget {
  const PreArView({Key key}) : super(key: key);

  @override
  _PreArViewState createState() => _PreArViewState();
}

class _PreArViewState extends State<PreArView> {
  Future<void> load() async {
    if (await Permission.camera.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      await Permission.contacts.request();
    }
    // Navigator.push(
    //         context,
    //         MaterialPageRoute<void>(builder: (context) => CreateEvent()),
    //       );
  }

  @override
  Widget build(BuildContext context) {
    load();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            "Открытие вида",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
