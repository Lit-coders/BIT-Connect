import 'package:flutter/material.dart';

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
Map<String, dynamic> getStatusStyle(int index, gpa) {
  final average = (gpa[index] - 0) / (4 - 0);
  if (average >= 0.8) {
    return {
      'color': Colors.green,
      'size': 7.0,
    };
  } else if (average >= 0.6) {
    return {
      'color': Colors.yellow,
      'size': 6.0,
    };
  } else if (average >= 0.4) {
    return {
      'color': Colors.orange,
      'size': 5.0,
    };
  } else {
    return {
      'color': Colors.red,
      'size': 6.5,
    };
  }
}
