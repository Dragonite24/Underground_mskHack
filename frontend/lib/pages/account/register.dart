import 'package:flutter/material.dart';
import '../../http.dart';
import '../../main.dart';
import '../../snackbar.dart';
import '../../widgets.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController email = TextEditingController(),
      name = TextEditingController(),
      password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => UndergroundScaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text("Регистрация",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text("Привет, приятно познакомиться!",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                UndergroundTextField(
                    text: "Имя",
                    controller: name,
                    icon: "email",
                    hintText: "Введите имя пользователя"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                UndergroundTextField(
                    text: "Электронная почта",
                    controller: email,
                    icon: "email",
                    hintText: "Введите электронную почту"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                UndergroundTextField(
                    text: "Пароль",
                    controller: password,
                    icon: "password",
                    hintText: "Введите пароль",
                    isPassword: true),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                UndergroundButton(
                    text: "Зарегистрироваться",
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("У вас уже есть аккаунт?",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black,
                      )),
                  GestureDetector(
                      onTap: () => Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => LogIn(),
                          )),
                      child: Text(" Войти",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.indigo,
                          )))
                ])
              ])));
}
