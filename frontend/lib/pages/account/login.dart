import 'package:Underground/http.dart';
import 'package:Underground/widgets.dart';
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Text("Войти",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text("Добро пожаловать!",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        UndergroundTextField(
                          text: "Электронная почта",
                          controller: email,
                          icon: "email",
                          hintText: "Введите электронную почту",
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        UndergroundTextField(
                            text: "Пароль",
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
                            height: MediaQuery.of(context).size.height * 0.01),
                        GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp())),
                            child: Container(
                                width: double.infinity,
                                height: 52,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: hide
                                            ? Colors.red
                                            : Color(0xffEAEFF3)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(hide ? "" : "Создать аккаунт",
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.black))))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: hide
                                        ? ""
                                        : 'Нажимая “Войти” или “Создать аккаунт”, вы соглашаетесь с нашими ',
                                  ),
                                  TextSpan(
                                      text: hide ? "" : 'Условиями',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      )),
                                  TextSpan(
                                    text: hide
                                        ? ""
                                        : '. Узнайте, как мы обрабатываем ваши данные, ознакомившись с ',
                                  ),
                                  TextSpan(
                                      text: hide
                                          ? ""
                                          : 'Политикой в отношении файлов cookie.',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline))
                                ]))
                      ]))));
}
