import 'dart:async';

import 'package:bit_connect/presentation/sims/components/status_graph.dart';
import 'package:bit_connect/presentation/sims/components/status_pie_chart.dart';
import 'package:bit_connect/presentation/sims/components/status_table.dart';
import 'package:bit_connect/presentation/sims/helpers/sims_helpers.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
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

Widget profileCard() {
  return Align(
    alignment: Alignment.topRight,
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      height: 30,
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
      child: FutureBuilder(
        future: getLoggedInStd(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              width: 15,
              height: 15,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorAssets.white,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text(
              '🫥something went wrong!',
              style: TextStyle(color: Colors.red),
            );
          } else {
            final response = snapshot.requireData;
            return Text(
              response[1],
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            );
          }
        },
      ),
    ),
  );
}

class _SIMSStatusState extends State<SIMSStatus> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SIMSProvider>(builder: (context, simsProvider, child) {
      return Scaffold(
        body: Stack(
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  StatusTable(),
                  StatusGraph(),
                  StatusPiChart(),
                ],
              ),
            ),
            profileCard(),
          ],
        ),
      );
    });
  }
}
