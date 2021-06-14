import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../const.dart';
import '../../../widgets.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return UndergroundScaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text('Создание события',
                      style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xFF333333))
                          .copyWith(fontFamily: Fonts().medium)),
                  Text('          '),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                        'Организуйте форум, интенсив, демо-день,\nпроведите лекцию или круглый стол',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().medium)),
                  ),
                  Row(
                    children: [
                      Text('Название:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 230,
                        child: TextFormField(
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
                            labelText: 'hintText',
                          ),
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Тип встречи:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 210,
                        child: TextFormField(
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
                            labelText: 'hintText',
                          ),
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Дата начала:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      TextButton(
                        onPressed: () async {
                          _selectDate(context);
                        },
                        child: Text(
                          DateFormat("dd.MM.yyyy")
                              .format(selectedDate)
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Время начала:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: 195,
                        child: TextButton(
                          onPressed: _selectTime,
                          child: Text(
                            '${_time.format(context)}',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Организатор:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 201,
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
                            labelText: 'hintText',
                          ),
                          controller: null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Указать контактные данные',
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF16FF00))
                            .copyWith(fontFamily: Fonts().medium)),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Адрес:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      Text('Указать адрес:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF16FF00))
                              .copyWith(fontFamily: Fonts().medium)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Загрузить фотографию:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      Text('Файл',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF16FF00))
                              .copyWith(fontFamily: Fonts().medium)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Сайт мероприятия:',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF333333))
                              .copyWith(fontFamily: Fonts().medium)),
                      SizedBox(width: 15),
                      Text('Сайт',
                          style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF16FF00))
                              .copyWith(fontFamily: Fonts().medium)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Описание:',
                        style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFF333333))
                            .copyWith(fontFamily: Fonts().medium)),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
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
                        labelText: 'Дайте описание мероприятия',
                      ),
                      controller: null,
                    ),
                  ),
                  UndergroundButton(text: 'Создать'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
