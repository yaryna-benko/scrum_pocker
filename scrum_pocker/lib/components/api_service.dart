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
      var url = Uri.parse('http://192.168.1.3/api/v1/rooms/1/getUsers');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Voter> _model = VoterFromJson(response.body);
        return _model;
      }else {
        log('message');
      }
    } catch (e) {
      log('boo');
      // log(e.toString());
    }
  }


}

// Future<http.Response?> createVRoom(VRoom data) async {
//   http.Response? response;
//   try {
//     response =
//     await http.post(
//         Uri.parse("http://localhost:9654/api/v1/rooms"),
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//         },
//         body: jsonEncode(data.toJson()));
//   } catch (e) {
//     log(e.toString());
//   }
//   return response;
// }

Future<VRoom> createVRoom(int id) async {

  final response =  await http.post(
    Uri.parse('http://192.168.1.3/api/v1/rooms'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(id)
  );
  

  if (response.statusCode == 201) {
    return VRoom.fromJson(jsonDecode(response.toString()));
  } else {
    throw Exception('Failed to create album.');
  }

}

class ApiConstants {
  static String baseUrl = "http://localhost:9654/api/v1";
}