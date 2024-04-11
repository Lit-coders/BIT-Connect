import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bit_connect/utils/constants/colorAssets.dart';
import 'package:bit_connect/presentation/onboarding/onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: ColorAssets.white,
      splash: Image.asset('../../assets/connect.png', height: 400, width: 400),
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: const Onbording(),
      duration: 3000,
    );
  }
}
