import 'package:team_up/const.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../widgets.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController(),
      name = TextEditingController(),
      password = TextEditingController(),
      username = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: UndergroundScaffold(
          body: Container(
        height: MediaQuery.of(context).size.height - 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            green.withOpacity(0.2),
            Colors.white,
          ],
        )),
        child: Column(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Image.asset('images/logo_imoscow.png',
                      width: 281, height: 58),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  Text("Поздравляем!",
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    'Ваша учетная запись была успешно создана.\nНажмите "Продолжить", чтобы начать\nиспользовать приложение.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFF333333))
                        .copyWith(fontFamily: Fonts().light),
                  ),
                  Image.asset(
                    'images/hands.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UndergroundButton(
                        text: "Продолжить",
                        onTap: () {
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      MyHomePage()));
                        }),
                  ),
                ]),
          ],
        ),
      )));
}
