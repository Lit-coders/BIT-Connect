import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'constants/colorAssets.dart';
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
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(200),
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.bars,
                        color: ColorAssets.primaryColor,
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
                            ColorAssets.primaryColor,
                            ColorAssets.secondaryColor
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.white,
              color: ColorAssets.primaryColor,
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
          ),
        ));
  }
}
