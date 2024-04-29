import 'package:shared_preferences/shared_preferences.dart';

Future<void> initializeLoginPreference(simsProvider) async {
  final loginPre = await SharedPreferences.getInstance();
  final isLoggedIn = loginPre.containsKey('simsUsername') &&
      loginPre.containsKey('simsPassword');
  simsProvider.setIsUserAlreadyLoggedIn(isLoggedIn);
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