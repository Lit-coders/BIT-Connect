import 'package:bit_connect/utils/constants/padConstants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../utils/constants/colorAssets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants/padConstants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                        height: PaddingConstant.horizontalPadding,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to BiT",
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "LitCoders",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingConstant.horizontalPadding),
                    child: Text("App Services")),

                Expanded(
                    child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ))

                //the 4 menus
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: ColorAssets.white,
            color: ColorAssets.bduColor,
            items: <Widget>[
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
