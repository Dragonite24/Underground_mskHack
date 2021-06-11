import 'package:Underground/code_input/src/verify_code_input_widget.dart';
import 'package:Underground/const.dart';
import 'package:Underground/pages/signIn/success.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: UndergroundScaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ]))));
}
