import 'package:bit_connect/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchGeneralStatus(String token) async {
  try {
    final response = await http.get(
      Uri.parse(GENERAL_STATUS_ENDPOINT),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print(response.body);

    return response;
  } catch (e) {
    rethrow;
  }
}
