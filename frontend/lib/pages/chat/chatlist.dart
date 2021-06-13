import 'package:team_up/models/chat/chatList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'chatroom.dart';

class ChatList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatList();
}

class _ChatList extends State<ChatList>
    with AutomaticKeepAliveClientMixin<ChatList> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(4.0, 10, 4, 10),
      children: <Widget>[
        ChatModelList('Наталия', 'Всего наилучшего!', '00:06'),
        ChatModelList('Алексей', 'Привет))', '01:10'),
      ],
    );
  }
}
