import 'package:bit_connect/presentation/home/components/left_drawer.dart';
import 'package:bit_connect/presentation/home/home_overview.dart';
import 'package:bit_connect/presentation/location/components/app_bar.dart';
import 'package:bit_connect/presentation/location/location_screen.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeContents = [
    const HomeOverview(),
    const HomeOverview(),
    const Location(),
    const HomeOverview(),
  ];
  int _contentIndex = 0;

  Widget getIcon({required IconData icon}) {
    return Icon(icon, size: 26, color: ColorAssets.white);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: _contentIndex != 2
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: TextButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: Image.asset(
                    'assets/icons/menu.png',
                    height: PaddingConstant.forPersonIcon,
                    color: ColorAssets.bduColor,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Handle person button press
                    },
                    icon: Image.asset(
                      'assets/icons/person.png',
                      height: PaddingConstant.forPersonIcon,
                      color: ColorAssets.bduColor,
                    ),
                  ),
                ],
              )
            : const LocationAppBar(),
        backgroundColor: Colors.white,
        drawer: const LeftDrawer(),
        body: homeContents[_contentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: _contentIndex,
          height: 50,
          backgroundColor: Colors.transparent,
          color: ColorAssets.bduColor,
          items: <Widget>[
            getIcon(icon: Icons.home),
            getIcon(icon: Icons.food_bank),
            getIcon(icon: Icons.location_city),
            getIcon(icon: Icons.person),
          ],
          onTap: (index) {
            setState(() {
              _contentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
