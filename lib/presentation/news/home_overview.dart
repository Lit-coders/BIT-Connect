import 'package:bit_connect/presentation/news/components/news_list.dart';
import 'package:bit_connect/presentation/news/components/news_slide.dart';
import 'package:bit_connect/presentation/home/components/user_welcomer.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeOverview extends StatefulWidget {
  const HomeOverview({super.key});

  @override
  State<HomeOverview> createState() => _HomeOverviewState();
}

class _HomeOverviewState extends State<HomeOverview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: PreferredSize(
              preferredSize: Size(getWidth(context), 100),
              child: const UserWelcomer(),
            ),
          ),
          const NewsSlide(),
          Container(
            width: getWidth(context),
            padding: const EdgeInsets.all(8.0),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: PaddingConstant.horizontalPadding),
              child: Text(
                "News",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ),
          Expanded(child: NewsList())
        ],
      ),
    );
  }
}
