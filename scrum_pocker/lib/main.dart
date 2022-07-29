import 'package:flutter/material.dart';
import 'components/constrains.dart';
import 'package:scrum_pocker/screens/room/room.dart';

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
      // routes: {
      //     'home': (context) => Home(),
      //     'login': (context) =>  Login(),
      //     'sighup': (context) =>  SighUp(),
      //   }
    );
  }
}
