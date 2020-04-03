import 'package:flutter_ui/chats/conversation.dart';
import 'package:flutter_ui/chats/user.dart';
import 'package:flutter_ui/chats/message.dart';

class MessageProvider {
  static User user1 = User(
    name: "Oussama Elmaaroufy",
    avatar: "assets/profiles/profile.jpg",
    phone: "+212602638556",
  );
  static User user2 = User(
    name: "Nabila Ben El maammar",
    avatar: "assets/profiles/profile.jpg",
    phone: "+212602638556",
  );

  static Conversation getConversation() {
    return Conversation(users: [
      user1,
      user2
    ], messages: [
      Message(
        sender: user1,
        receiver: user2,
        dateTime: "22:35",
        body: "body message",
      ),
      Message(
        sender: user2,
        receiver: user1,
        dateTime: "12-09-2020",
        body: "body message",
      ),
      Message(
        sender: user1,
        receiver: user2,
        dateTime: "22:35",
        body: "body message",
      ),
      Message(
        sender: user2,
        receiver: user1,
        dateTime: "12-09-2020",
        body: "body message",
      ),
      Message(
        sender: user1,
        receiver: user2,
        dateTime: "22:35",
        body: "body message",
      ),
      Message(
        sender: user2,
        receiver: user1,
        dateTime: "12-09-2020",
        body: "body message",
      ),
      Message(
        sender: user1,
        receiver: user2,
        dateTime: "22:35",
        body: "body message",
      ),
      Message(
        sender: user2,
        receiver: user1,
        dateTime: "12-09-2020",
        body: "body message",
      ),
    ]);
  }

  static List<Conversation> getConversations() {
    return [
      Conversation(users: [
        user1,
        user2
      ], messages: [
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
      ]),
      Conversation(users: [
        user1,
        user2
      ], messages: [
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
      ]),
      Conversation(users: [
        user1,
        user2
      ], messages: [
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
      ]),
      Conversation(users: [
        user1,
        user2
      ], messages: [
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
        Message(
          sender: user1,
          receiver: user2,
          dateTime: "22:35",
          body: "body message",
        ),
        Message(
          sender: user2,
          receiver: user1,
          dateTime: "12-09-2020",
          body: "body message",
        ),
      ]),
    ];
  }
}
