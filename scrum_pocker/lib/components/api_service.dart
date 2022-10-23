import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrum_pocker/components/constrains.dart';
import 'package:scrum_pocker/models/voters.dart';

class ApiService {
  Future<List<Voter>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      final response = await http.get( url,);
      if (response.statusCode == 200) {
        List<Voter> _model = VoterFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log('boo');
      // log(e.toString());
    }
  }
}

class ApiConstants {
  static String baseUrl = "http://localhost:9654/api/v1";
  static String usersEndpoint = "/users/inroom/1";
}