import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:bit_connect/presentation/news/news_overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsModel(),
      child: const NewsOverview(),
    );
  }
}
