import 'package:bit_connect/home_page.dart';
import 'package:bit_connect/presentation/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BiTConnect extends StatelessWidget {
  const BiTConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading indicator if authentication state is being fetched
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle error
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else if (snapshot.hasData) {
            // User is authenticated, show home page
            return const HomePage();
          } else {
            return const Auth();
          }
        },
      ),
    );
  }
}
