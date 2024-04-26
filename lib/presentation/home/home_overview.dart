import 'package:bit_connect/presentation/home/components/news_slide.dart';
import 'package:bit_connect/presentation/home/components/user_welcomer.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:bit_connect/utils/home_screen_options.dart';
import 'package:flutter/material.dart';

class HomeOverview extends StatefulWidget {
  const HomeOverview({super.key});

  @override
  State<HomeOverview> createState() => _HomeOverviewState();
}

class _HomeOverviewState extends State<HomeOverview> {
  //The 4 home Screen options
  List myOptions = [
    ["About BiT", "assets/icons/abt.png"],
    ["Cafe", "assets/icons/cafe.png"],
    ["Lounge", "assets/icons/lounge.png"],
    ["Calculator", "assets/icons/calc.png"]
  ];

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
                "App Services",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingConstant.horizontalPadding),
            child: GridView.builder(
              itemCount: myOptions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return HomePageOptions(
                  name: myOptions[index][0],
                  iconPath: myOptions[index][1],
                );
              },
            ),
          ))

          //the 4 menus
        ],
      ),
    );
  }
}
