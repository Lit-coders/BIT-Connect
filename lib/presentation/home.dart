import 'package:bit_connect/utils/constants/padConstants.dart';
import 'package:bit_connect/utils/gridforhome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../utils/constants/colorAssets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants/padConstants.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //The 4 home Screen options
  List myOptions = [
    ["About BiT", "assets/icons/abt.png"],
    ["Cafe", "assets/icons/cafe.png"],
    ["Lounge", "assets/icons/lounge.png"],
    ["Calculator", "assets/icons/calc.png"]
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                //custom appbar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingConstant.horizontalPadding,
                      vertical: PaddingConstant.verticalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/menu.png',
                        height: 45,
                        color: ColorAssets.bduColor,
                      ),
                      Image.asset(
                        'assets/icons/person.png',
                        height: PaddingConstant.forPersonIcon,
                        color: ColorAssets.bduColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Welcome
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: PaddingConstant.horizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to BiT,",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.amber,
                              fontSize: 20
                            ),
                          ),
                          Text(
                            "LitCoders",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 40,
                            fontFamily: AutofillHints.addressCity,
                            fontWeight: FontWeight.w800
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: PaddingConstant.horizontalPadding),
                        child: Text("App Services", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)),
                  ],
                ),

                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: PaddingConstant.horizontalPadding),
                  child: GridView.builder(
                    itemCount: myOptions.length,
                    gridDelegate:
                         const SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: ColorAssets.white,
            color: ColorAssets.bduColor,
            items: const <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: ColorAssets.white,
              ),
              Icon(Icons.food_bank, size: 30, color: ColorAssets.white),
              Icon(Icons.location_city, size: 30, color: ColorAssets.white),
              Icon(Icons.person, size: 30, color: ColorAssets.white)
            ],
            onTap: (index) {
              //Handle button tap
            },
          ),
        ));
  }
}
