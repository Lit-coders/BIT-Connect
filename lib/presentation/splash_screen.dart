import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bit_connect/presentation/auth/auth.dart';
import 'package:bit_connect/presentation/onboarding/onboarding_screen.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFirstTime = true; 

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _isFirstTime = prefs.getString('username') == null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: ColorAssets.white,
      splash: Image.asset('assets/connect.png', height: 400, width: 400),
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: _isFirstTime ? const Onboarding() : const Auth(),
      duration: 3000,
    );
  }
}
