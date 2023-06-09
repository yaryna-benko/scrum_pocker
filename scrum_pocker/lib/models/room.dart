import 'dart:async';
import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<VRoom> VRoomFromJson(String str) =>
    List<VRoom>.from(json.decode(str).map((x) => VRoom.fromJson(x)));

class VRoom{
  int id;
  String room_number;
  int scrummaster;
  int lifetime;
  String created_date;

  VRoom({
    required this.id,
    required this.room_number,
    required this.scrummaster,
    required this.lifetime,
    required this.created_date
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["room_number"] = room_number;
    data['scrummaster'] = scrummaster;
    data['lifetime'] = lifetime;
    data['created_date'] = created_date;
    return data;
  }

  factory VRoom.fromJson(Map<String, dynamic> json) {
    return VRoom(
      id: json['id'],
      room_number: json['room_number'],
      scrummaster: json['scrummaster'],
      lifetime: json['lifetime'],
      created_date: json['created_date'],
    );
  }
}