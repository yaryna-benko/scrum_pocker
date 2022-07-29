import 'package:flutter/material.dart';
import 'package:scrum_pocker/components/constrains.dart';
import 'components/body.dart';

class Room extends StatelessWidget {
  static String routeName = "/room";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}