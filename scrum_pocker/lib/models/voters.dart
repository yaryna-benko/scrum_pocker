import 'package:flutter/material.dart';

class MyVoters {
  final int id;
  final String name, vote;
  final bool hasVoted;

  MyVoters({
    required this.id,
    required this.name,
    required this.vote,
    this.hasVoted = false,
  });
}

List<MyVoters> demoVoters = [
  MyVoters(
    id: 1,
    name: "Dunkan",
    vote: '8',
    hasVoted: false,
  ),
    MyVoters(
    id: 2,
    name: "Jack",
    vote: '5',
    hasVoted: true,
  ),
];