import 'package:bit_connect/presentation/sims/model/sims_std.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SIMSProvider extends ChangeNotifier {
  int _previousIndex = 0;
  bool _isLoginCanceled = false;
  Student? student;

  void setPreviousIndex(int index) {
    _previousIndex = index;
    notifyListeners();
  }

  void setIsLoginCanceledFalse() {
    _isLoginCanceled = false;
    notifyListeners();
  }

  void cancelLogin() {
    _isLoginCanceled = true;
    notifyListeners();
  }

  int get previousIndex => _previousIndex;
  bool get isLoginCanceled => _isLoginCanceled;

  // manage Account
  Future<void> login(username, password) async {
    try {
      SharedPreferences loginPref = await SharedPreferences.getInstance();
      loginPref.setString('username', username);
      loginPref.setString('username', password);
    } catch (e) {
      // let's hope the error will not happen next time
    }
  }
}
