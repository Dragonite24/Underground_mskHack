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
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back_ios_new_rounded)),
                            Text('Шаг 2/2',
                                style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Color(0xFF333333))
                                    .copyWith(fontFamily: Fonts().light)),
                            Text('         '),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Text("Поздравляем!",
                            style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Color(0xFF333333))
                                .copyWith(fontFamily: Fonts().bold)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5),
                        UndergroundButton(
                            text: "Продолжить",
                            onTap: () {
                              bool canSignUp = true;
                              if (canSignUp) {
                                // Http()
                                //     .register(name.text, password.text, email.text)
                                //     .then((value) async {
                                //   if (value) {
                                //     // если зарегались, то логинимся
                                //     Http().login(name.text, password.text).then(
                                //       (val) async {
                                //         if (val) {
                                //           Navigator.push<void>(
                                //               context,
                                //               MaterialPageRoute<void>(
                                //                   builder: (BuildContext context) =>
                                //                       MyHomePage()));
                                //         } else {
                                //           Snackbar.show(context);
                                //         }
                                //       },
                                //     );
                                //   } else {
                                //     Snackbar.show(context);
                                //   }
                                // });
                                Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            MyHomePage()));
                              }
                            }),
                      ]),
                ],
              ))));
}
