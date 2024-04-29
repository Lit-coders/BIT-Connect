import 'package:flutter/material.dart';

class NewsAge extends StatelessWidget {
  final String uploadTime;

  const NewsAge({super.key, required this.uploadTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: uploadTime == 'Just now' ? Colors.green : Colors.black38,
        ),
        Text(
          uploadTime,
          style: TextStyle(
            color: uploadTime == 'Just now' ? Colors.green : Colors.black38,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
