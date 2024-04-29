import 'package:bit_connect/presentation/sims/model/sims_std.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SIMSProvider extends ChangeNotifier {
  int _previousIndex = 0;
  bool _isLoginCanceled = false;
  Student? student;
  bool _isUserLoggedInBefore = true;
  bool _isLoading = false;
  String _error = "";

  void setPreviousIndex(int index) {
    _previousIndex = index;
    notifyListeners();
  }

  void setIsLoginCanceledFalse() {
    _isLoginCanceled = false;
    notifyListeners();
  }

  void setIsUserAlreadyLoggedIn(bool truthValue) {
    _isUserLoggedInBefore = truthValue;
    notifyListeners();
  }

  void setIsLoading(bool truthValue) {
    _isLoading = truthValue;
    notifyListeners();
  }

  void setError(String newError) {
    _error = newError;
    notifyListeners();
  }

  int get previousIndex => _previousIndex;
  bool get isLoginCanceled => _isLoginCanceled;
  bool get isUserLoggedInBefore => _isUserLoggedInBefore;
  bool get isLoading => _isLoading;

  void cancelLogin() {
    _isLoginCanceled = true;
    notifyListeners();
  }

  // manage Account
  Future<void> login(username, password) async {
    try {
      SharedPreferences loginPref = await SharedPreferences.getInstance();
      loginPref.clear();
      loginPref.setString('simsUsername', username);
      loginPref.setString('simsPassword', password);
      _isUserLoggedInBefore = true;
    } catch (e) {
      // let's hope the error will not happen next time
    } finally {
      notifyListeners();
    }
  }
}