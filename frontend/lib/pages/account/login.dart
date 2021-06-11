import 'package:Underground/http.dart';
import 'package:Underground/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../indicator.dart';
import '../../main.dart';
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

  String errorEmail = "", phoneError = "", errorPassword = "";

  TextEditingController email = TextEditingController(),
      password = TextEditingController();

  AnimationController _animationController;

  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isLoggedIn)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    setState(() => isLoading = false);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_animationController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(Duration(seconds: 1)).then((value) {
                _animationController.reset();
                setState(() => hide = false);
              });
            }
          });
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async => false,
      child: isLoading
          ? Scaffold(
              body: Center(
              child: Indicator.circle,
            ))
          : UndergroundScaffold(
              body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2),
                        Text("Добро пожаловать!",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Color(0xFF333333))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text("Войдите чтобы продолжить",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Color(0xFF333333))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        UndergroundTextField(
                          text: "",
                          controller: email,
                          icon: "email",
                          hintText: "Введите электронную почту",
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        UndergroundTextField(
                            text: "",
                            controller: password,
                            icon: "password",
                            hintText: "Введите пароль",
                            isPassword: true),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) => Transform.scale(
                                scale: _animation.value,
                                child: UndergroundButton(
                                    text: hide ? "" : "Войти",
                                    onTap: () {
                                      bool canSignUp = true;
                                      if (canGetEmail)
                                        setState(() => errorEmail = "");
                                      else
                                        setState(() {
                                          errorEmail = "Не указано имя";
                                          canSignUp = false;
                                        });
                                      if (canGetPassword)
                                        setState(() => errorPassword = "");
                                      else
                                        setState(() {
                                          errorPassword =
                                              "Не правильно указан email";
                                          canSignUp = false;
                                        });
                                      if (canSignUp) {
                                        // Http()
                                        //     .sendEmail(email.text,
                                        //         password.text)
                                        //     .then((value) async {
                                        //   if (value) {
                                        //     setState(() {
                                        //       hide = true;
                                        //       email.text = "";
                                        //       password.text = "";
                                        //     });
                                        //     _animationController.forward();
                                        //   } else
                                        //     setState(() {
                                        //       errorEmail =
                                        //           "Такого аккаунта не существует";
                                        //       errorPassword =
                                        //           "Такого аккаунта не существует";
                                        //     });
                                        // });
                                      }
                                    }))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
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
                                                builder: (context) =>
                                                    SignUp())),
                                      text: 'Забыли пароль?',
                                      style:
                                          TextStyle(color: Color(0xFF16FF00)))
                                ])),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
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
                                  ),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp())),
                                      text: 'Создать аккаунт',
                                      style: TextStyle(
                                          color: Color(0xFF16FF00),
                                          decoration: TextDecoration.underline))
                                ]))
                      ]))));
}
