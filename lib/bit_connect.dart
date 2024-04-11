import 'package:bit_connect/presentation/auth/auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Auth(),
    );
  }
}
