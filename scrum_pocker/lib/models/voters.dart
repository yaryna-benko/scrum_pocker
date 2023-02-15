import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Voter> VoterFromJson(String str) =>
    List<Voter>.from(json.decode(str).map((x) => Voter.fromJson(x)));

String VoterToJson(List<Voter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Voter {
  Voter({
    required this.id,
    required this.uid,
    required this.name,
    required this.created,
    required this.vote,
    required this.settings,
    required this.is_scrummaster

  });

  final int id;
  final String uid;
  final String name;
  final String created;
  final int vote;
  final String settings;
  final bool is_scrummaster;



  factory Voter.fromJson(Map<String,dynamic> json) => Voter(
      id: json['id'],
      uid: json['uid'],
      name: json['name'],
      created: json['created'],
      vote: json['vote'],
      settings: json['settings'],
      is_scrummaster: json['is_scrummaster']

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "created": created,
        "vote": vote,
        "settings": settings,
        "is_scrummaster": is_scrummaster
      };
}

