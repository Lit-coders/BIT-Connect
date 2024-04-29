import 'package:bit_connect/presentation/home/components/news_slide.dart';
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
    ["About BiT", "assets/icons/abt2.png"],
    ["Cafe", "assets/icons/cafe.png"],
    ["Lounge", "assets/icons/lounge.png"],
    ["Calculator", "assets/icons/calc.png"]
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //custom appbar
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //       horizontal: PaddingConstant.horizontalPadding,
          //       vertical: PaddingConstant.verticalPadding),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       TextButton(
          //         onPressed: () {
          //           _scaffoldKey.currentState
          //               ?.openDrawer(); // Open the drawer
          //         },
          //         child: Image.asset(
          //           'assets/icons/menu.png',
          //           height: 45,
          //           color: ColorAssets.bduColor,
          //         ),
          //       ),
          //       Image.asset(
          //         'assets/icons/person.png',
          //         height: PaddingConstant.forPersonIcon,
          //         color: ColorAssets.bduColor,
          //       ),
          //     ],
          //   ),
          // ),

          const SizedBox(
            height: 20,
          ),

          //Welcome
          const NewsSlide(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: PaddingConstant.horizontalPadding),
                      
                  child: SafeArea(
                    child: Expanded(
                      child: Text(
                        "App Services",
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24,fontFamily: 'Poppins'),
                      ),
                    ),
                  )),
            ],
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
