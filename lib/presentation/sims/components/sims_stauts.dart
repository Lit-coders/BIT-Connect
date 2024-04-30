import 'dart:async';

import 'package:bit_connect/presentation/sims/api/sims_general_status.dart';
import 'package:bit_connect/presentation/sims/components/status_graph.dart';
import 'package:bit_connect/presentation/sims/components/status_pie_chart.dart';
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

class _SIMSStatusState extends State<SIMSStatus> {
  Future<void> clear() async {
    final SharedPreferences x = await SharedPreferences.getInstance();
    x.clear();
  }

  Widget profileCard(std) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, -2),
                spreadRadius: 1,
                color: Colors.white30,
              ),
              BoxShadow(
                offset: Offset(-2, 2),
                spreadRadius: 1,
                blurRadius: 10,
                color: Colors.black38,
              )
            ]),
        child: Text(std.fullName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchGeneralStatus();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Consumer<SIMSProvider>(
              builder: (context, value, child) => const Column(
                children: [
                  StatusTable(),
                  StatusGraph(),
                  StatusPiChart(),
                ],
              ),
            ),
          ),
          // profileCard(simsProvider.loggedInStd)
        ],
      ),
    );
  }
}
