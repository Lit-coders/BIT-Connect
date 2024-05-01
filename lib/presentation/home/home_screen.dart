import 'package:bit_connect/common/app_bar.dart';
import 'package:bit_connect/presentation/gpa/gpa_calculator_screen.dart';
import 'package:bit_connect/presentation/home/components/left_drawer.dart';
import 'package:bit_connect/presentation/location/location_screen.dart';
import 'package:bit_connect/presentation/news/news_provider.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/presentation/sims/sims.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeContents = [
    const News(),
    const GpaCalculatorScreen(),
    const Location(),
    const SIMS(),
  ];
  int _contentIndex = 0;

  Widget getIcon({required IconData icon}) {
    return Icon(icon, size: 26, color: ColorAssets.white);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Consumer<SIMSProvider>(
      builder: (context, simsProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            key: scaffoldKey,
            appBar: appBarChooser(_contentIndex, context, scaffoldKey),
            backgroundColor: Colors.white,
            drawer: const LeftDrawer(),
            body: homeContents[simsProvider.isLoginCanceled
                ? simsProvider.previousIndex
                : _contentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              index: simsProvider.isLoginCanceled
                  ? simsProvider.previousIndex
                  : _contentIndex,
              height: 50,
              backgroundColor: Colors.transparent,
              color: ColorAssets.bduColor,
              items: <Widget>[
                getIcon(icon: Icons.home),
                getIcon(icon: Icons.calculate),
                getIcon(icon: Icons.place),
                getIcon(icon: Icons.school),
              ],
              onTap: (index) {
                setState(() {
                  if (index != 3) {
                    simsProvider.setPreviousIndex(index);
                  }
                  simsProvider.setIsLoginCanceledFalse();

                  _contentIndex = index;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
