import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GpaCircularProgress extends StatelessWidget {
  final double gpa;
  final double size;
  final double maxGpa;
  final double minGpa;


  const GpaCircularProgress({
    required this.gpa,
    this.size = 100.0,
    this.minGpa = 0.0,
    this.maxGpa = 4.0,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = (gpa - minGpa) / (maxGpa - minGpa); 

    return SizedBox(
      width : size,
      height : size,
      child : CircularProgressIndicator (
        value : progressValue == 0 ? 100.0 : progressValue,
        strokeWidth : 10,
        backgroundColor : Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
          _getColorForProgress(progressValue),
      ),
    )
    );
  }

  Color _getColorForProgress(double progressValue) {
    if (progressValue >= 0.8) {
      return Colors.green;
    } else if (progressValue >= 0.6) {
      return Colors.yellow;
    } else if (progressValue >= 0.4) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

}