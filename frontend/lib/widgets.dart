import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UndergroundScaffold extends StatelessWidget {
  final Widget appBar, body;

  UndergroundScaffold({this.appBar, this.body});

  @override
  Widget build(BuildContext context) => MediaQuery(

    ///  Изменение системного размера текста заблокировано для того,
    /// чтобы вёрстка не падала
    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    child: Scaffold(
      appBar: appBar,

      ///  Страница скроллится для того, чтобы при разделении экрана на два
      /// (на андроиде), вёрстка не падала
      body: SingleChildScrollView(

        child: SafeArea(
          child: body,
        )
      )
    )
  );
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

  UndergroundTextField({
    this.text = "",
    this.icon = "",
    this.hintText = "",
    this.errorText = "",
    this.controller,
    this.onChanged,
    this.isPhone = false,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
          text,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
          )
      ),
      SizedBox(height: 12),
      Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 19.2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color(0xffEAEFF3)
              )
          ),
          child: Row(
              children: [
                SvgPicture.asset(
                    "images/text_field/$icon.svg",
                    width: 15.75,
                    height: 12.38
                ),
                SizedBox(width: 13.2),
                Container(
                    width: MediaQuery.of(context).size.width - 101,
                    child: TextField(
                        controller: controller,
                        onChanged: onChanged,
                        obscureText: isPassword,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixText: isPhone ? '+7 (' : null,
                            hintText: isPhone ? "___) ___-__-__" : hintText,
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.grey,
                            )
                        )
                    )
                )
              ]
          )
      ),
      Text(
          errorText,
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.red
          )
      )
    ]
  );
}

class UndergroundButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isOpacity;

  UndergroundButton({
    @required this.text,
    this.onTap,
    this.isOpacity = true
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: isOpacity ? 1 : 0.5,
        child: Container(
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10), //border corner radius
                boxShadow:[
                  BoxShadow(
                      offset: Offset(0.0, 12.0),
                      blurRadius: 40.0,
                      color: Colors.grey,
                  )
                ]
            ),
            child: Center(
                child: Text(
                    text,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white
                    )
                )
            )
        )
      )
  );
}