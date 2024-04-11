import 'package:bit_connect/presentation/auth/auth.dart';
import 'package:flutter/material.dart';

class BiTConnect extends StatelessWidget {
  const BiTConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Auth(),
    );
  }
}
