import 'package:flutter/material.dart';
import 'package:scrum_pocker/screens/cards/body.dart';
import 'components/constrains.dart';
import 'package:scrum_pocker/screens/room/room.dart';
import 'package:scrum_pocker/screens/result/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home:  Room(),
      routes: {
          'cards': (context) => Body(),
          'room': (context) =>  Room(),
          'result': (context) =>  Result(),
        }
    );
  }
}
