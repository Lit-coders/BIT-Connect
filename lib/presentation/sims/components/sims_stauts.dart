import 'dart:async';

import 'package:bit_connect/presentation/sims/components/status_table.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SIMSStatus extends StatefulWidget {
  const SIMSStatus({super.key});

  @override
  State<SIMSStatus> createState() => _SIMSStatusState();
}

Future<void> clear() async {
  final SharedPreferences x = await SharedPreferences.getInstance();
  x.clear();
}

class _SIMSStatusState extends State<SIMSStatus> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SIMSProvider>(builder: (context, simsProvider, child) {
      final std = simsProvider.loggedInStd;
      return const Scaffold(
        body: Center(
          child: StatusTable(),
        ),
      );
    });
  }
}
