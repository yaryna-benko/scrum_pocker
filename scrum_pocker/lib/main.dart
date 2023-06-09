import 'package:flutter/material.dart';
import 'package:scrum_pocker/screens/cards/body.dart';
import 'package:scrum_pocker/screens/sessions/session.dart';
import 'components/constrains.dart';
import 'package:scrum_pocker/screens/room/room.dart';
import 'package:scrum_pocker/screens/result/result.dart';
import 'package:scrum_pocker/screens/landing page/body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  HBody(),
      routes: {
          'cards': (context) => CBody(),
          'room': (context) =>  Room(),
          'result': (context) =>  Result(),
          'home': (context) => HBody(),
          'sessions': (context) => SessionScreen()
        }
    );
  }
}
