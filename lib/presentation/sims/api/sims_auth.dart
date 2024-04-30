import 'dart:convert';

import 'package:bit_connect/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

Future<http.Response> loginSIMS(username, password) async {
  try {
    final data = {
      'username': username,
      'password': password,
    };

    final jsonData = jsonEncode(data);

    final response = await http.post(Uri.parse(SIMS_LOGIN_ENDPOINT),
        body: jsonData, headers: {'Content-Type': 'application/json'});

    return response;
  } catch (e) {
    rethrow;
  }
}
