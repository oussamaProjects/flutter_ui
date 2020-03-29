import 'package:flutter/material.dart';
import 'package:flutter_ui/profiles/profile_1/profile_1.dart';
import 'package:flutter_ui/profiles/profile_2/profile_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile2(),
    );
  }
}
