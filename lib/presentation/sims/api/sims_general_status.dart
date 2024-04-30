import 'dart:convert';

import 'package:bit_connect/presentation/sims/model/general_status.dart';
import 'package:bit_connect/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fetchGeneralStatus() async {
  try {
    SharedPreferences stdPref = await SharedPreferences.getInstance();
    final token = stdPref.getString('simsToken');

    final response = await http.get(
      Uri.parse(GENERAL_STATUS_ENDPOINT),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final Map<String, dynamic> body = jsonDecode(response.body);
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      final List<Map<String, dynamic>> statusResult = body['generalStatus'];
      final List<GeneralStatus> generalStatus = [];
      print(generalStatus);
      //  generalStatus.addAll(statusResult.map((e) => )) ;
    } else {
      if (body['error'].isNotEmpty) {
        print(body);
      }
    }
  } catch (e) {
    rethrow;
  }
}
