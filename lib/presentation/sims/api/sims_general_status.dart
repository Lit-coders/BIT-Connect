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
    final Map<String, dynamic> body = jsonDecode(response.body);
    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      return generateModel(body['generalStatus']);
    } else if (body['error'].isNotEmpty) {
      if (body['error']['message'] == 'Unauthorized') {
        logout();
      }
    } else {
      throw Exception(body['error']['message']);
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
  // [{"academicyear":"2020/2021","year":"1","semester":"I","registrationDate":"7/23/2021","registrationCondition":"Normal Load","sgpa":"4","cgpa":"4","prevStatus":" ","finalStatus":"Pass"},{"academicyear":"2020/2021","year":"1","semester":"II","registrationDate":"10/8/2021","registrationCondition":"Normal Load","sgpa":"4","cgpa":"4","prevStatus":"Pass","finalStatus":"Pass"},{"academicyear":"2021/2022","year":"2","semester":"I","registrationDate":"3/25/2022","registrationCondition":"Normal Load","sgpa":"3.89","cgpa":"3.96","prevStatus":"Pass","finalStatus":"Pass"},{"academicyear":"2021/2022","year":"2","semester":"II","registrationDate":"6/7/2022","registrationCondition":"Normal Load","sgpa":"3.33","cgpa":"3.8","prevStatus":"Pass","finalStatus":"Pass"},{"academicyear":"2022/2023","year":"3","semester":"I","registrationDate":"10/31/2022","registrationCondition":"Normal Load","sgpa":"3.41","cgpa":"3.72","prevStatus":"Pass","finalStatus":"Pass"},{"academicyear":"2022/2023","year":"3","semester":"II
  List<GeneralStatus> generalStatus = List.generate(body.length, (index) {
    return GeneralStatus(
      academicYear: body[index]['academicyear'],
      semester: body[index]['semester'],
      batch: body[index]['year'],
      regDate: body[index]['registrationDate'],
      regCondition: body[index]['registrationCondition'],
      sGpa: body[index]['sgpa'],
      cGpa: body[index]['cgpa'],
      prevStatus: body[index]['prevStatus'],
      finalStatus: body[index]['finalStatus'],
    );
  });
  return generalStatus;
}
