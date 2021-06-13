import 'package:team_up/const.dart';
import 'package:team_up/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../http.dart';
import '../../main.dart';
import '../../snackbar.dart';
import 'register.dart';

class LogIn extends StatefulWidget {
  final bool isLoggedIn;

  LogIn({this.isLoggedIn = false});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  bool isLoading = true, hide = false;
  bool canGetEmail = false, canGetPhoneNumber = false, canGetPassword = false;

  TextEditingController username = TextEditingController(),
      password = TextEditingController();

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: UndergroundScaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                    Image.asset('images/logo_imoscow.png',
                        width: 281, height: 58),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Text("Добро пожаловать!",
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 24,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().bold)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text("Войдите чтобы продолжить",
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().light)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    UndergroundTextField(
                      controller: username,
                      icon: "email",
                      hintText: "Логин",
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    UndergroundTextField(
                        controller: password,
                        icon: "password",
                        hintText: "Пароль",
                        isPassword: true),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    UndergroundButton(
                        text: "Войти",
                        onTap: () {
                          bool canSignUp = true;
                          if (canSignUp) {
                            Http()
                                .getToken(username.text, password.text)
                                .then((value) async {
                              if (value != null) {
                                Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            MyHomePage()));
                              } else
                                Snackbar.show(context);
                            });
                          }
                        }),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF333333)),
                            children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp())),
                                  text: 'Забыли пароль?',
                                  style: TextStyle(color: Color(0xFF16FF00))
                                      .copyWith(fontFamily: Fonts().light))
                            ])),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF333333)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Нет аккаунта? ',
                                  style: TextStyle()
                                      .copyWith(fontFamily: Fonts().light)),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp())),
                                  text: 'Создать аккаунт',
                                  style: TextStyle(color: Color(0xFF16FF00))
                                      .copyWith(fontFamily: Fonts().light))
                            ]))
                  ]))));
}
