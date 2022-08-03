import 'package:flutter/material.dart';

class MyCards {
  final int id;
  final String rank;
  bool wasChosen;

  MyCards({
    required this.id,
    required this.rank,
    this.wasChosen = false,
  });
}

List<MyCards> demoCards = [
  MyCards(
    id: 1,
    rank: "1",
    wasChosen: false,
  ),
  MyCards(
    id: 2,
    rank: "2",
    wasChosen: false,
  ),
    MyCards(
    id: 3,
    rank: "3",
    wasChosen: false,
  ),
    MyCards(
    id: 4,
    rank: "5",
    wasChosen: false,
  ),
    MyCards(
    id: 5,
    rank: "8",
    wasChosen: false,
  ),
    MyCards(
    id: 6,
    rank: "13",
    wasChosen: false,
  ),
    MyCards(
    id: 7,
    rank: "21",
    wasChosen: false,
  ),
    MyCards(
    id: 8,
    rank: "34",
    wasChosen: false,
  ),
    MyCards(
    id: 9,
    rank: "?",
    wasChosen: false,
  ),
];