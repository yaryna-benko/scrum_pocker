import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrum_pocker/components/constrains.dart';
import 'package:scrum_pocker/models/voters.dart';
import 'package:scrum_pocker/models/room.dart';

class ApiService {
  Future<List<Voter>?> getUsers() async {
    try {
      var path = 'http://localhost:9654/api/v1/rooms/' + RoomId + '/getUsers';
      var url = Uri.parse(path);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Voter> _model = VoterFromJson(response.body);
        return _model;
      }else {
        log('message');
      }
    } catch (e) {
      log(e.toString());
    }
  }


}

Future<VRoom> putUserInVRoom(String id) async {
  var path = 'http://localhost:9654/api/v1/rooms/' + RoomId + '/join/5';
  final response = await http.put(
    Uri.parse(path),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': id,
    }),
  );

  if (response.statusCode == 200) {
    return VRoom.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to put user in room');
  }
}

Future<VRoom> createVRoom() async {
  final response =  await http.post(
    Uri.parse('http://localhost:9654/api/v1/rooms'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
  

  if (response.statusCode == 201) {
    return VRoom.fromJson(jsonDecode(response.toString()));
  } else {
    throw Exception('Failed to create album.');
  }

}

class ApiConstants {
  static String baseUrl = "http://localhost:9654/api/v1";
}