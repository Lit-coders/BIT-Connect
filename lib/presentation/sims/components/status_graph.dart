import 'package:bit_connect/presentation/sims/components/status_color.dart';
import 'package:bit_connect/presentation/sims/components/title.dart';
import 'package:bit_connect/presentation/sims/model/general_status.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatusGraph extends StatefulWidget {
  List<GeneralStatus> generalStatus;
  StatusGraph({super.key, required this.generalStatus});

  @override
  State<StatusGraph> createState() => _StatusGraphState();
}

class _StatusGraphState extends State<StatusGraph> {
  final List<double> gpa = [];
  final List<String> year = [];
  final List<String> time = [];

  void initializeStatus() {
    final List<GeneralStatus> status = widget.generalStatus;

    String str1 = '';
    String str2 = '';

    for (var i = 0; i < status.length; i++) {
      gpa.add(status[i].cGpa);
      year.add(status[i].academicYear);
      str1 = year[i].split('/')[0].substring(2);
      str2 = year[i].split('/')[1].substring(2);
      time.add('$str1/$str2 ${status[i].semester}');
    }
  }

  FlGridData gridData() {
    return FlGridData(
      show: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          strokeWidth: 1,
          gradient: LinearGradient(
            colors: gradientColor(),
          ),
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          strokeWidth: 1,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: gradientColor(),
          ),
        );
      },
    );
  }

  List<Color> gradientColor() {
    return [
      const Color.fromARGB(34, 255, 0, 191),
      const Color.fromARGB(255, 161, 11, 211),
      const Color.fromARGB(255, 53, 0, 118),
      const Color.fromARGB(255, 161, 11, 211),
      const Color.fromARGB(34, 255, 0, 191),
    ];
  }

  AxisTitles axisTitles(name, isBottom) {
    return AxisTitles(
      axisNameSize: 26,
      axisNameWidget: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 70, 127),
          ),
        ),
      ),
      sideTitles: SideTitles(
        interval: isBottom ? 1 : 0.5,
        showTitles: true,
        reservedSize: isBottom ? 45 : 30,
        getTitlesWidget: (value, meta) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: isBottom ? 4.0 : 2.0,
              horizontal: 2.0,
            ),
            child: SideTitleWidget(
              axisSide: meta.axisSide,
              child: isBottom
                  ? Column(
                      children: time[value.toInt()]
                          .split(" ")
                          .map(
                            (text) => tileText(text),
                          )
                          .toList(),
                    )
                  : tileText(value.toString()),
            ),
          );
        },
      ),
    );
  }

  Text tileText(text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 33, 60),
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  FlDotData flDotData() {
    return FlDotData(
        show: true,
        getDotPainter: (
          FlSpot spot,
          double xPercentage,
          LineChartBarData bar,
          int index,
        ) {
          final Map<String, dynamic> dotStyle = getStatusStyle(index, gpa);
          return FlDotCirclePainter(
            color: dotStyle['color'],
            radius: dotStyle['size'],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    initializeStatus();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            title(context, 'Graphical Academic Summary'),
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 20, top: 20),
                height: getWidth(context),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 30, 0, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: LineChart(
                    LineChartData(
                      gridData: gridData(),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: axisTitles('Academic Year', true),
                        leftTitles: axisTitles('CGPA', false),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: gpa.asMap().entries.map((entry) {
                            return FlSpot(
                              entry.key.toDouble(),
                              entry.value,
                            );
                          }).toList(),
                          isCurved: true,
                          color: Colors.blue,
                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: flDotData(),
                        ),
                      ],
                      minX: 0,
                      maxX: gpa.length.toDouble() - 1,
                      minY: 0,
                      maxY: 4,
                    ),
                    duration: const Duration(seconds: 5),
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
