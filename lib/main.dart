import 'dart:io';

import 'package:bit_connect/bit_connect.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bit_connect/presentation/onboarding/onboard.dart';
import 'package:bit_connect/presentation/SplashScreen.dart';

void main() {
  runApp( 
    const BitConnect(),
  );
}

class BitConnect extends StatelessWidget {
  const BitConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bit-Connect",
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const Home(), 
        '/onboarding': (context) => const Onbording(), 
        // '/cafe': (context) => const Cafe(), // 
      },
    );
  }
}