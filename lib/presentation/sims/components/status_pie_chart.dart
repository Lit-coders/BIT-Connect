import 'package:bit_connect/presentation/sims/components/status_color.dart';
import 'package:bit_connect/presentation/sims/components/title.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatusPiChart extends StatefulWidget {
  const StatusPiChart({super.key});

  @override
  State<StatusPiChart> createState() => _StatusPiChartState();
}

class _StatusPiChartState extends State<StatusPiChart> {
  final List<double> gpa = [0, 2.3, 3.5, 2.8, 3.7, 4.0, 1.87];
  final List<String> time = [
    '20/20 i',
    '20/20 I',
    '20/20 II',
    '20/21 I',
    '20/21 II',
    '20/22 I',
    '20/22 II',
  ];

  double calcTotalCgpa() {
    final totalCgpa = gpa.reduce((value, element) => value + element);
    print(totalCgpa);
    return totalCgpa;
  }

  List<PieChartSectionData> pieChartSection() {
    return List.generate(gpa.length, (index) {
      return PieChartSectionData(
        color: getStatusStyle(index)['color'],
        radius: 120,
        value: gpa[index],
        badgeWidget: badge(index),
        badgePositionPercentageOffset: 6,
      );
    });
  }

  Widget badge(index) {
    return Container(
      color: ColorAssets.bduColor,
      child: Text(time[index]),
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
