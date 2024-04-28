import 'package:flutter/material.dart';

class SIMSProvider extends ChangeNotifier {
  int _previousIndex = 0;
  bool _isLoginCanceled = false;

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
}
