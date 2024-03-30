import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'colorAssets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottomNavBar.dart';
import 'drawer.dart';

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
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(200),
              child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ListTile(
                                  leading: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.bars,
                      color: ColorAssets.bduColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                                  ),
                                ),
                  ))),

          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          ColorAssets.bduColor,
                          ColorAssets.lightSecondary
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: ColorAssets.bduColor,
            items: [
              CurvedNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: ColorAssets.bduColor,
                  ),
                  label: "Home"),
              CurvedNavigationBarItem(
                  icon: Icon(
                    Icons.location_on,
                    size: 30,
                    color: ColorAssets.bduColor,
                  ),
                  label: "Sites"),
              CurvedNavigationBarItem(
                  icon: Icon(
                    Icons.food_bank_sharp,
                    size: 30,
                    color: ColorAssets.bduColor,
                  ),
                  label: "Cafe"),
              CurvedNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: ColorAssets.bduColor,
                  ),
                  label: "User"),
            ],
          ),
        ),
      ),
    );
  }
}
