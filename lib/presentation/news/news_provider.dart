import 'package:bit_connect/presentation/news/news_overview.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => NewsModel(),
    //   child: const NewsOverview(),
    // );
    return const NewsOverview();
  }
}
