import 'dart:async';
import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class VRoom{
  int id;
  String room_number;
  int scrummaster;
  int lifetime;

  VRoom({
    required this.id,
    required this.room_number,
    required this.scrummaster,
    required this.lifetime
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["room_number"] = room_number;
    data['scrummaster'] = scrummaster;
    data['lifetime'] = lifetime;
    return data;
  }

  factory VRoom.fromJson(Map<String, dynamic> json) {
    return VRoom(
      id: json['id'],
      room_number: json['title'],
      scrummaster: json['scrummaster'],
      lifetime: json['lifetime'],
    );
  }
}