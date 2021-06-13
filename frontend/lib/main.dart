import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'navBar.dart';
import 'pages/signIn/login.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher_foreground');

final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

void main() => runApp(MyApp());

// GlobalKey<NavigatorState> currentNavigatorKey(index) {
//   switch (index) {
//     case 0:
//       return mapKey;
//       break;
//     case 1:
//       return projectsKey;
//       break;
//     case 2:
//       return cardsKey;
//       break;
//     case 3:
//       return chatKey;
//       break;
//     case 4:
//       return profileKey;
//       break;
//   }
//   return null;
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }

  void _handleTabSelection() {
    setState(() {});
  }

  // Tab _tabItem(IconData iconData, int index, Color selectedColor) {
  //   return Tab(
  //     icon: FaIcon(
  //       iconData,
  //       size: 26,
  //       color: _tabController.index == index ? selectedColor : Colors.grey,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: UndergroundNavbar(),
          ),
        ),
      ),
    );
  }
}
