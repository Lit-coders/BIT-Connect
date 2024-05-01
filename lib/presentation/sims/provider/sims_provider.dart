import 'package:bit_connect/presentation/sims/model/sims_std.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SIMSProvider extends ChangeNotifier {
  int _previousIndex = 0;
  bool _isLoginCanceled = false;
  bool _isUserLoggedInBefore = true;
  bool _isStatusWithLogin = true;

  Student? _loggedInStd;

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

  void setIsStatusWithLogin(bool truthValue) {
    _isStatusWithLogin = truthValue;
    notifyListeners();
  }

  void serLoggedInStd(Student student) {
    _loggedInStd = student;
    notifyListeners();
  }

  int get previousIndex => _previousIndex;
  bool get isLoginCanceled => _isLoginCanceled;
  bool get isUserLoggedInBefore => _isUserLoggedInBefore;
  bool get isStatusWithLogin => _isStatusWithLogin;
  Student? get loggedInStd => _loggedInStd;

  void cancelLogin() {
    _isLoginCanceled = true;
    notifyListeners();
  }

  // save currently logged in account
  Future<void> login(
    username,
    fullName,
    password,
    token,
  ) async {
    try {
      SharedPreferences loginPref = await SharedPreferences.getInstance();
      loginPref.clear();
      loginPref.setString('simsUsername', username);
      loginPref.setString('simsPassword', password);
      loginPref.setString('simsFullName', fullName);
      loginPref.setString('simsToken', token);
      initializeCurrentUser(loginPref);
      _isUserLoggedInBefore = true;
    } catch (e) {
      // let's hope the error will not happen next time
    } finally {
      notifyListeners();
    }
  }

  // retrieve currently logged in account
  void initializeCurrentUser(SharedPreferences studentPre) {
    final simsUsername = studentPre.getString('simsUsername');
    final simsToken = studentPre.getString('simsToken');
    final simsStdName = studentPre.getString('simsFullName');

    _loggedInStd = Student(
        username: simsUsername!, fullName: simsStdName!, token: simsToken!);
  }
}
