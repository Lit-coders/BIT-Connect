import 'package:bit_connect/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response> fetchGeneralStatus() async {
  try {
    final SharedPreferences loginPref = await SharedPreferences.getInstance();
    final String? token = loginPref.getString('simsToke');

    final response = await http.get(
      Uri.parse(GENERAL_STATUS_ENDPOINT),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${token ?? ''}"
      },
    );

    return response;
  } catch (e) {
    rethrow;
  }
}
