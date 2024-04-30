import 'package:bit_connect/presentation/sims/api/sims_general_status.dart';
import 'package:bit_connect/presentation/sims/components/status_graph.dart';
import 'package:bit_connect/presentation/sims/components/status_pie_chart.dart';
import 'package:bit_connect/presentation/sims/components/status_table.dart';
import 'package:bit_connect/presentation/sims/model/general_status.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class SIMSStatus extends StatefulWidget {
  const SIMSStatus({super.key});

  @override
  State<SIMSStatus> createState() => _SIMSStatusState();
}

class _SIMSStatusState extends State<SIMSStatus> {
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

  Widget load() {
    return Align(
      child: Container(
        color: Colors.blue.withOpacity(.3),
        width: getWidth(context),
        height: getHeight(context),
        child: const Center(
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget error(error) {
    return Align(
      child: SizedBox(
        child: Center(
          child: SizedBox(
            width: 22,
            height: 22,
            child: Text(error),
          ),
        ),
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
            child: FutureBuilder(
              future: fetchGeneralStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return load();
                } else if (snapshot.hasError) {
                  return error(snapshot.error);
                } else if (snapshot.hasData) {
                  final List<GeneralStatus> generalStatus =
                      snapshot.requireData;
                  return Column(
                    children: [
                      StatusTable(generalStatus: generalStatus),
                      StatusGraph(generalStatus: generalStatus),
                      StatusPiChart(generalStatus: generalStatus),
                    ],
                  );
                }
                return const Spacer();
              },
            ),
          ),
          // profileCard(simsProvider.loggedInStd)
        ],
      ),
    );
  }
}
