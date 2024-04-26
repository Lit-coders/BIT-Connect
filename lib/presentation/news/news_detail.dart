import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  Map<String, dynamic> news;

  NewsDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
