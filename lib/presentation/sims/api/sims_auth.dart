import 'dart:convert';

import 'package:bit_connect/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

Future<String> loginSIMS(username, password) async {
  try {
    // Create a map to hold the data

    final data = {
      'username': username,
      'password': password,
    };

    // Convert the map to a JSON string
    final jsonData = jsonEncode(data);

    // Send the POST request with the sdJSON body
    final response = await http.post(Uri.parse(SIMS_LOGIN_ENDPOINT),
        body: jsonData, headers: {'Content-Type': 'application/json'});
    return response.body;
  } catch (e) {
    rethrow;
  }
}
