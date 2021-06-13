import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:team_up/models/event.dart';
import 'package:team_up/models/token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'models/afterReg.dart';
import 'models/myProgects.dart';

class Http {
  final String url = "hollapuppy.pythonanywhere.com"; // api url

  Future<AfterRegister> register(String name, password, email) async {
    var body = json.encoder
        .convert({"username": name, "password": password, "email": email});
    final response = await http.post(
      Uri.http(url, "/api/auth/users/"),
      body: body,
      headers: {'Content-type': 'application/json'},
    );
    AfterRegister model;
    if (response.statusCode < 300) {
      model = afterRegisterFromJson(response.body);
      log('Register STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return model;
    } else {
      log('Register STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return model;
    }
  }

  Future<GetToken> getToken(String username, password) async {
    var body =
        json.encoder.convert({"username": username, "password": password});
    final response = await http.post(
      Uri.http(url, "/api/token/"),
      body: body,
      headers: {'Content-type': 'application/json'},
    );
    print(body);
    GetToken token;
    if (response.statusCode < 300) {
      log('getToken STATUS CODE: ' + response.statusCode.toString());
      token = getTokenFromJson(response.body);
      return token;
    } else {
      log('getToken STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return token;
    }
  }

  Future<bool> newIndivid(String username, email, id) async {
    var body =
        json.encoder.convert({"FIO": username, "email": email, "user": id});
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.http(url, "/api/individual/new"),
      body: body,
      headers: headers,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      log('Login STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return true;
    } else {
      log('Login STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      return false;
    }
  }

  Future<List<GetMyProjects>> getMyProjects() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final response = await http.get(
      Uri.http(url, "/api/project/all"),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode < 300) {
      List<GetMyProjects> proj = getMyProjectsFromJson(response.body);
      return proj;
    } else {
      log('getmyProjects STATUS CODE: ' + response.statusCode.toString());
      log(response.body);
      throw ('getmyProjects STATUS CODE: ' + response.statusCode.toString());
    }
  }

  static Future<List<int>> getEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    //if (DateTime.now().second % 5 == 0) throw Exception("No connection");
    if (false) throw Exception("No connection");
    return [1, 2, 3];
  }

  static Future<Event> getEvent(int eventId) async {
    switch (eventId) {
      case 1:
        return Event(
          name: "Регулярная игра в Межвузовском клубе интеллектуальных игр",
          shortDesc: "Томск, Точка кипения ТУСУР Томск",
          dateTime: new DateTime(2021, 06, 13, 14, 30),
          fullDescription:
              """Синхронный турнир по «Что? Где? Когда?» (или, сокращенно, синхрон) — заочная форма соревнований по спортивному варианту «Что? Где? Когда?», предусматривающая согласованное проведение в сжатый срок соревнований на одном и том же пакете вопросов в нескольких различных населённых пунктах.
Кроме индивидуальной регистрации, нужна регистрация команд в группе Томское ЧГК""",
          adress: "Томск, ул Красноармейская, д. 147",
          contactEmail: "astrowander@gmail.com",
          eventSite: "https://leader-id.ru/events/211581",
          type: EventType.Forum,
        );
        break;
      case 2:
        return Event(
          name: "Английский с нуля",
          shortDesc: "Калуга, Точка кипения - Калуга",
          dateTime: new DateTime(2021, 06, 13, 15, 00),
          fullDescription:
              """Представляем вашему вниманию курс английского языка, основанный на методе самопознания и последовательного развития базовых лингвистических навыков. 
Данный курс предназначен для всех желающих изучать английский язык; в нем объединены новейшие техники, позволяющие продуктивно работать с информацией таким образом, что помимо освоения необходимого словарного запаса и основ грамматики создается также функциональная база знаний, запрограммированная на непрерывный рост.
Неоспоримое достоинство данного курса состоит в том, что в отличие от тривиальных курсов, нацеленных на изучение каких-либо правил, насилующих память и притупляющих воображение всякого здравомыслящего человека, здесь ставится и благополучно решается задача о понимании этим человеком своих действий, мыслей, желаний, страхов, in short – самого себя; язык же используется лишь как инструмент, комплектующий и развивающий это понимание.
В данном курсе представлены техники, основанные на более чем десятилетнем опыте автора по изучению психологии, философии, лингвистики и не-популярной литературы, подкрепленном четырехлетним стажем управления английским разговорным клубом. """,
          adress: "Калуга, ул Октябрьская, д. 17А",
          contactEmail: "svetashevvladimir@ya.ru",
          eventSite: "https://leader-id.ru/events/206504",
          type: EventType.Lection,
        );
        break;
      case 3:
        return Event(
          name: "Мастер-класс по голосо-речевой практике",
          shortDesc: "Хабаровск, Точка кипения - Хабаровск",
          dateTime: new DateTime(2021, 06, 13, 15, 00),
          fullDescription:
              """Здесь не будет лектора и слушающей аудитории. Все станем участниками мастер-класса и сразу попробуем простые артикуляционные и дыхательные упражнения. 
Всего за час мы максимально познакомимся, поиграем в мяч и попробуем поговорить с пробкой. 
Не обойдем стороной и культуру речи, обязательно затронем основные ошибки в ударениях. 
Одевайтесь удобно и приходите с желанием общаться и знакомиться 😀 """,
          adress: "Хабаровск, ул Муравьева-Амурского, д. 33",
          contactEmail: "v79244358948@yandex.ru",
          eventSite: "https://leader-id.ru/events/209775",
          type: EventType.Lection,
        );
        break;
      default:
        throw Exception("Ivalid event id");
        break;
    }
  }
}
