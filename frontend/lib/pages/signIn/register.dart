import 'package:Underground/const.dart';
import 'package:Underground/pages/signIn/success.dart';
import 'package:flutter/material.dart';
import '../../http.dart';
import '../../main.dart';
import '../../snackbar.dart';
import '../../widgets.dart';
import 'сonfirmation.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

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
                                .then((value) async {
                              if (value != null) {
                                // если зарегались, то логинимся
                                Http()
                                    .register2(
                                        username.text, value.id, email.text)
                                    .then(
                                  (val) async {
                                    if (val) {
                                      Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  MyHomePage()));
                                    } else {
                                      Snackbar.show(context);
                                    }
                                  },
                                );
                              } else {
                                Snackbar.show(context);
                              }
                            });
                          }
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      MyHomePage()));
                        }),
                  ]))));
}
