import 'package:flutter_ui/chats/message.dart';
import 'package:flutter_ui/chats/user.dart';

class Conversation {
  List<User> users;
  List<Message> messages;
  Conversation({this.users, this.messages});
}
