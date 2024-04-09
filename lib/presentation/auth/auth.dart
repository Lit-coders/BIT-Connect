import 'package:bit_connect/presentation/auth/login_page.dart';
import 'package:bit_connect/presentation/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool _showLoginPage = true;

  void toggleAuthScreens() {
    setState(() {
      _showLoginPage = !_showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showLoginPage) {
      return Login(
        toggleToSignUP: toggleAuthScreens,
      );
    } else {
      return SignUP(
        toggleToLogin: toggleAuthScreens,
      );
    }
  }
}
