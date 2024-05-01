import 'package:bit_connect/presentation/sims/api/sims_general_status.dart';
import 'package:bit_connect/presentation/sims/components/status_graph.dart';
import 'package:bit_connect/presentation/sims/components/status_pie_chart.dart';
import 'package:bit_connect/presentation/sims/components/status_table.dart';
import 'package:bit_connect/presentation/sims/model/general_status.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SIMSStatus extends StatefulWidget {
  const SIMSStatus({super.key});

  @override
  State<SIMSStatus> createState() => _SIMSStatusState();
}

class _SIMSStatusState extends State<SIMSStatus> {
  bool _isRetrying = false;
  Widget profileCard(username) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(username)),
      ),
    );
  }

  Widget load() {
    return Align(
      child: Container(
        color: Colors.white,
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
    return Center(
      child: Container(
        width: getWidth(context),
        height: getHeight(context) * 1 / 3,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
                onPressed: () => setState(
                      () {
                        _isRetrying = true;
                      },
                    ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        size: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('try again'),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchGeneralStatus(context);
    return Scaffold(
      body: FutureBuilder(
        future: fetchGeneralStatus(context),
        builder: (context, snapshot) {
          final simsProvider =
              Provider.of<SIMSProvider>(context, listen: false);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return load();
          } else if (snapshot.hasError) {
            print('Something went wrong, please try again!');
            return error(simsProvider.statusError);
          } else if (snapshot.hasData) {
            if (simsProvider.statusError.isNotEmpty) {
              print("the error happens there, ");
              return error(simsProvider.statusError);
            } else if (snapshot.requireData.isNotEmpty) {
              final List<GeneralStatus> generalStatus = snapshot.requireData;
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    profileCard(generalStatus[0].fullName),
                    StatusTable(generalStatus: generalStatus),
                    StatusGraph(generalStatus: generalStatus),
                    StatusPiChart(generalStatus: generalStatus),
                  ],
                ),
              );
            }
          }
          return error('Something went wrong, please try again!');
        },
      ),
    );
  }
}
