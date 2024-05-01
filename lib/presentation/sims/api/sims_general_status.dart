import 'dart:convert';

import 'package:bit_connect/presentation/sims/model/general_status.dart';
import 'package:bit_connect/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<GeneralStatus>> fetchGeneralStatus() async {
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
    final Map<String, dynamic> body =
        jsonDecode(response.body) as Map<String, dynamic>;

    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      final List<Map<String, dynamic>> castedBody =
          List.generate(body['generalStatus'].length, (index) {
        return body['generalStatus'][index] as Map<String, dynamic>;
      });

      return generateModel(castedBody);
    } else if (body['error'].isNotEmpty) {
      if (body['error']['message'] == 'Unauthorized') {
        logout();
      }
    } else {
      throw Exception();
    }

    return [];
  } catch (e) {
    rethrow;
  }
}

Future<void> logout() async {
  final SharedPreferences x = await SharedPreferences.getInstance();
  x.clear();
}

List<GeneralStatus> generateModel(List<Map<String, dynamic>> body) {
  List<GeneralStatus> generalStatus = List.generate(body.length, (index) {
    return GeneralStatus(
      academicYear: body[index]['academicyear'],
      semester: body[index]['semester'],
      batch: body[index]['year'],
      regDate: body[index]['registrationDate'],
      regCondition: body[index]['registrationCondition'],
      sGpa: double.parse(body[index]['sgpa']),
      cGpa: double.parse(body[index]['cgpa']),
      prevStatus: body[index]['prevStatus'],
      finalStatus: body[index]['finalStatus'],
    );
  });
  return generalStatus;
}
