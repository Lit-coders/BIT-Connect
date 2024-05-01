import 'package:shared_preferences/shared_preferences.dart';

// shared preference
Future<void> initializeLoginPreference(simsProvider) async {
  final loginPre = await SharedPreferences.getInstance();
  final isLoggedIn = loginPre.containsKey('simsUsername') &&
      loginPre.containsKey('simsPassword');
  simsProvider.setIsUserAlreadyLoggedIn(isLoggedIn);
}

// get current student
Future<List> getLoggedInStd() async {
  try {
    SharedPreferences stdRef = await SharedPreferences.getInstance();
    final token = stdRef.getString('simsToken');
    final username = stdRef.getString('simsUsername');
    final fullName = stdRef.getString('simsFullName');
    return [token, username, fullName];
  } catch (e) {
    //
  }
  return [];
}

String? usernameValidator(String? username) {
  if (username!.isEmpty) {
    return 'username is required!';
  } else if (!isUsernameValid(username)) {
    return 'username is not valid, please try again!';
  }
  return null;
}

bool isUsernameValid(String username) {
  final RegExp pattern = RegExp(r'^BDU\d+$');
  if (username.contains(pattern)) {
    return true;
  }
  return false;
}

String? passwordValidator(String? password) {
  if (password!.isEmpty) {
    return 'Password is required!';
  }
  return null;
}
