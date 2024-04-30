import 'package:bit_connect/presentation/sims/helpers/sims_helpers.dart';
import 'package:flutter/material.dart';

class SIMSStatus extends StatefulWidget {
  const SIMSStatus({super.key});

  @override
  State<SIMSStatus> createState() => _SIMSStatusState();
}

class _SIMSStatusState extends State<SIMSStatus> {
  String? _username;
  String? _token;
  String? _fullName;

  Future<void> initializeLoginData() async {
    try {
      final loginData = await getStudentData();
      setState(() {
        _username = loginData!['username'];
        _token = loginData['token'];
        _fullName = loginData['fullName'];
      });
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeLoginData();

    return Scaffold(
      body: Center(
        child: Text('Welcome, $_token'),
      ),
    );
  }
}
