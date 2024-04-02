import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  List<IntroModel> pages(BuildContext context) {
    return [
      IntroModel(
        title: Text(
          'Excellent Student Experience',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        description: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        image: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            'assets/studentsreading.png',
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
      ),
      IntroModel(
        title: Text(
          'Excellent Student Experience',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        description: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        image: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            'assets/studentsreading.png',
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
      ),
      IntroModel(
        title: Text(
          'Excellent Student Experience',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        description: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        image: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            'assets/studentsreading.png',
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
      ),
    ];
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigator(
        // Add Navigator widget here
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: FlutterOnBoarding(
                pages: pages(context),
                onDone: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnbordingScreen(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
