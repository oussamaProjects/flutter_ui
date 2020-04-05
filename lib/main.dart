import 'package:flutter/material.dart';
// import 'package:flutter_ui/registrations/registartion2.dart';
// import 'package:flutter_ui/chats/chat2/chat_screen.dart';
// import 'package:flutter_ui/chats/message_provider.dart';
// import 'package:flutter_ui/registrations/registration.dart';
// import 'package:flutter_ui/registrations/registration3.dart';
// import 'package:flutter_ui/registrations/registration4.dart';
import 'package:flutter_ui/registrations/registration5.dart';
// import 'package:flutter_ui/chats/chat1/chat_list.dart';
// import 'package:flutter_ui/profiles/profile_1/profile_1.dart';
// import 'package:flutter_ui/profiles/profile_2/profile_2.dart';
// import 'package:flutter_ui/profiles/profile_3/profile_3.dart';
// import 'package:flutter_ui/profiles/profile_4/profile_4.dart';
// import 'package:flutter_ui/profiles/profile_5/profile_5.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter UI Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Registration5()
    );
  }
}
