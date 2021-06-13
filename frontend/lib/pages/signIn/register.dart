import 'package:team_up/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:team_up/pages/signIn/%D1%81onfirmation.dart';
import 'package:team_up/pages/signIn/success.dart';
import '../../http.dart';
import '../../main.dart';
import '../../snackbar.dart';
import '../../widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  SharedPreferences prefs;

  @override
  void initState() {
    getPref();
    super.initState();
  }

  void getPref() async {
    print(1);
    prefs = await SharedPreferences.getInstance();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        Text('Шаг 1/2',
                            style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xFF333333))
                                .copyWith(fontFamily: Fonts().light)),
                        Text('         '),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Image.asset('images/logo_imoscow.png',
                        width: 281, height: 58),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text("Регистрация",
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().bold)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                        "Пожалуйста, укажите следующие детали\nдля Вашей новой учетной записи",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().light)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    UndergroundTextField(
                      controller: username,
                      icon: "email",
                      hintText: "Имя и Фамилия",
                    ),
                    UndergroundTextField(
                      controller: email,
                      icon: "password",
                      hintText: "Почта",
                    ),
                    UndergroundTextField(
                        controller: password,
                        icon: "password",
                        hintText: "Пароль",
                        isPassword: true),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    UndergroundButton(
                        text: "Продолжить",
                        onTap: () {
                          bool canSignUp = true;
                          if (canSignUp) {
                            Http()
                                .register(
                                    username.text, password.text, email.text)
                                .then((value1) async {
                              if (value1 != null) {
                                // если зарегались, то логинимся
                                Http()
                                    .getToken(username.text, password.text)
                                    .then(
                                  (value2) async {
                                    Http()
                                        .newIndivid(username.text, email.text,
                                            value1.id)
                                        .then((value) => Navigator.push<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        Success())));
                                  },
                                );
                              } else {
                                Snackbar.show(context);
                              }
                            });
                          }
                        }),
                  ]))));
}
