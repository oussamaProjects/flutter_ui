import 'package:flutter_ui/chats/user.dart';

class Message {
  User sender, receiver;
  String dateTime, body;
  Message({this.sender, this.receiver, this.dateTime, this.body});
}
