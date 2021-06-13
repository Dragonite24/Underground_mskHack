import 'package:team_up/code_input/src/verify_code_input_widget.dart';
import 'package:team_up/const.dart';
import 'package:team_up/pages/signIn/success.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../widgets.dart';

class Confirmation extends StatefulWidget {
  final String email;

  Confirmation({this.email});
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation>
    with SingleTickerProviderStateMixin {
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
                        Text('Шаг 2/2',
                            style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xFF333333))
                                .copyWith(fontFamily: Fonts().medium)),
                        Text('         '),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text("Подтверждение",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Color(0xFF333333))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                                text:
                                    '      Введите 4-значный код,\nкоторый мы отправили на адрес\n',
                              ),
                              TextSpan(
                                  text: '${widget.email}',
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Color(0xFF16FF00))),
                            ])),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    VerifyCodeInput(onComplete: (String value) {
                      //
                      setState(() {
                        Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => Success()));
                      });
                      // HttpService()
                      //     .enterCodeAndGetToken(widget.controller, value,
                      //         context, widget.isSignup)
                      //     .then((value) {
                      //   if (value != null)
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => widget.isSignup
                      //             ? RelifeNavbar(isFromSignUp: true)
                      //             : EnterNewPassword(
                      //                 email: widget.controller,
                      //                 isFromAccount: false)));
                      //   else {
                      //     var snackBar =
                      //         SnackBar(content: Text("Что-то пошло не так"));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //   }
                      // });
                    }),
                  ]))));
}
