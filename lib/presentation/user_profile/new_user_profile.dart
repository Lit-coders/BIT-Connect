import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({super.key});

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  final _currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "logged in with id: ${_currentUser?.email}",
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
