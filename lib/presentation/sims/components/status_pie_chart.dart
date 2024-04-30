import 'package:bit_connect/presentation/sims/components/status_color.dart';
import 'package:bit_connect/presentation/sims/components/title.dart';
import 'package:bit_connect/presentation/sims/model/general_status.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatusPiChart extends StatefulWidget {
  List<GeneralStatus> generalStatus;
  StatusPiChart({super.key, required this.generalStatus});

  @override
  State<StatusPiChart> createState() => _StatusPiChartState();
}

class _StatusPiChartState extends State<StatusPiChart> {
  final List<double> gpa = [2.3, 3.5, 2.8, 3.7, 4.0, 1.87];
  final List<String> time = [
    '2021/22 I',
    '2022/22 II',
    '2022/23 I',
    '2022/23 II',
    '2023/24 I',
    '2023/24 II',
  ];

  List<List<dynamic>> calcTotalCgpa() {
    List<double> partGPA = [];
    List<String> years = [];

    for (var i = 0; i < gpa.length; i = i + 1) {
      if (i % 2 == 0) {
        partGPA.add((((gpa[i] + gpa[i + 1]) / 2)).round().toDouble());
        years.add(time[i].split(" ")[0].toString());
      }
    }

    return [partGPA, years];
  }

  List<PieChartSectionData> pieChartSection() {
    return List.generate(gpa.length, (index) {
      final color = getStatusStyle(index, gpa)['color'];
      return PieChartSectionData(
        color: color,
        radius: 120,
        value: gpa[index],
        badgeWidget: badge(
          time[index],
          color,
        ),
        badgePositionPercentageOffset: 1,
      );
    });
  }

  Widget badge(content, color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          color: color,
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
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            title(context, 'Pie-Charted Academic Summary'),
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 20, top: 20),
                height: getWidth(context),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 30, 0, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 3,
                      centerSpaceRadius: 0,
                      sections: pieChartSection(),
                      pieTouchData: PieTouchData(
                        enabled: true,
                      ),
                    ),

                    swapAnimationDuration:
                        const Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
