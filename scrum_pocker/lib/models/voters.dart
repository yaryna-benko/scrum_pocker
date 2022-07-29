import 'package:flutter/material.dart';

class MyVoters {
  final int id;
  final String name;
  final bool hasVoted;

  MyVoters({
    required this.id,
    required this.name,
    this.hasVoted = false,
  });
}

List<MyVoters> demoVoters = [
  MyVoters(
    id: 1,
    name: "Dunkan",
    hasVoted: false,
  ),
    MyVoters(
    id: 1,
    name: "Jack",
    hasVoted: true,
  ),
];