import 'package:Underground/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color green = Color(0xFF16FF00);
const Color blue = Color(0xFF4CFFC9);

class UndergroundScaffold extends StatelessWidget {
  final Widget appBar, body, backgroundColor;

  UndergroundScaffold({this.appBar, this.body, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      ///  Изменение системного размера текста заблокировано для того,
      /// чтобы вёрстка не падала
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,

        /// Страница скроллится для того, чтобы при разделении экрана на два
        /// (на андроиде), вёрстка не падала
        body: SingleChildScrollView(
          child: SafeArea(
            child: body,
          ),
        ),
      ),
    );
  }
}

class UndergroundTextField extends StatelessWidget {
  final String text;
  final String icon;
  final String hintText;
  final String errorText;
  final TextEditingController controller;
  final ValueChanged onChanged;
  final bool isPhone;
  final bool isPassword;

  UndergroundTextField(
      {this.text = "",
      this.icon = "",
      this.hintText = "",
      this.errorText = "",
      this.controller,
      this.onChanged,
      this.isPhone = false,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontFamily: Fonts().light),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                    labelText: hintText,
                  ),
                  controller: controller,
                ),
              )
            ],
          ),
        ),
        Text(
          errorText,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

class UndergroundButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isOpacity;

  UndergroundButton({@required this.text, this.onTap, this.isOpacity = true});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Opacity(
          opacity: isOpacity ? 1 : 0.5,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF16FF00),
                  Color(0xFF4CFFC9),
                ],
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 14.0),
                  blurRadius: 15.0,
                  color: Color(0x420C9E18),
                )
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFF333333),
                ).copyWith(fontFamily: Fonts().light),
              ),
            ),
          ),
        ),
      );
}

class UndergroundOutlinedButton {
  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xFF16FF00),
      Color(0xFF4CFFC9),
    ]),
    borderRadius: BorderRadius.circular(32),
  );
}
