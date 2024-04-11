import 'package:bit_connect/presentation/auth/login_page.dart';
import 'package:bit_connect/presentation/auth/sign_up_screen.dart';
import 'package:bit_connect/presentation/user_profile/abc.dart';
import 'package:bit_connect/presentation/user_profile/new_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (snapshot.hasData) {
          print("stream data: ${snapshot.data}");
          if (_showLoginPage) {
            return const Abc();
          } else {
            return const BuildProfile();
          }
        } else {
          if (_showLoginPage) {
            return Login(toggleToSignUP: toggleAuthScreens);
          } else {
            return SignUP(toggleToLogin: toggleAuthScreens);
          }
        }
      },
    );
  }
}
