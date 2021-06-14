import 'package:team_up/pages/chat/chatroom.dart';
import 'package:flutter/material.dart';

class ChatModelList extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;

  ChatModelList(this.title, this.subtitle, this.date);

  @override
  _ChatModelListState createState() => _ChatModelListState();
}

class _ChatModelListState extends State<ChatModelList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CircleAvatar(
          radius: 40,
          child: Image.asset('images/profile/erik.jpg'),
        ),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      trailing: Padding(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
        child: Column(
          children: <Widget>[
            Text(widget.date),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatRoom(
                  'Kim',
                  'Female / 32km / 5h',
                  'Lately my hobbies include weightlifting and tinkering with music (no, I will not call myself a DJ). If you want to know more, just ask.',
                )),
      ),
    );
  }
}
