import 'dart:io';

import 'package:bit_connect/presentation/home/home_screen.dart';
import 'package:bit_connect/presentation/onboarding/onboarding_screen.dart';
import 'package:bit_connect/presentation/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyAZUj7DJ0vSNqkvIdGaI6E4O1j_eMp5Sxc",
            appId: "1:880080912408:android:451d0acd1adf12a566036d",
            messagingSenderId: "880080912408",
            projectId: "bit-connect-7569f",
          ),
        )
      : await Firebase.initializeApp();
  runApp(
    const BitConnect(),
  );
}

class BitConnect extends StatelessWidget {
  const BitConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bit-Connect",
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const Home(),
        '/onboarding': (context) => const Onboarding(),
        // '/cafe': (context) => const Cafe(), //
      },
    );
  }
}
