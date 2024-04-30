import 'package:bit_connect/presentation/sims/components/title.dart';
import 'package:flutter/material.dart';

class StatusGraph extends StatefulWidget {
  const StatusGraph({super.key});

  @override
  State<StatusGraph> createState() => _StatusGraphState();
}

class _StatusGraphState extends State<StatusGraph> {
  final status = {
    'Academic Year': [
      '2020/2021',
      '2020/2021',
      '2020/2021',
      '2020/2021',
      '2020/2021',
      '2020/2021'
    ],
    'Batch': ['1', '1', '1', '1', '1', '1'],
    'Semester': ['I', "II", 'I', "II", 'I', "II"],
    'Registration Date': [
      '7/23/2021',
      '10/8/2021',
      '7/23/2021',
      '10/8/2021',
      '7/23/2021',
      '10/8/2021'
    ],
    'Reg Condition': [
      "Normal Load",
      "Normal Load",
      "Normal Load",
      "Normal Load",
      "Normal Load",
      "Normal Load"
    ],
    'SGPA': ['1.2', '3.4', '1.2', '3.4', '1.2', '3.4'],
    'CGPA': ['2.3', '2.3', '2.3', '2.3', '2.3', '2.3'],
    'prevStatus': ['Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass'],
    'finalStatus': ['Pass', 'Pass', 'Pass', 'Pass', 'Pass', 'Pass'],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title(context, 'PiCharted Academic Summary'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: AspectRatio(
            aspectRatio: 2,
            
            child: 
          ),
        ),
      ],
    );
  }
}
