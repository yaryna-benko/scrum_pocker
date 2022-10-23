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

  });

  int id;
  String uid;
  String name;



  factory Voter.fromJson(Map<String,dynamic> json) => Voter(
        id: json["id"],
        uid: json["name"],
        name: json["name"],

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,

      };
}

