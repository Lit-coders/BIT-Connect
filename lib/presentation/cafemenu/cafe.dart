import 'dart:io';

import 'package:bit_connect/utils/constants/colorAssets.dart';
import 'package:bit_connect/utils/constants/padConstants.dart';
import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CafeMenu extends StatefulWidget {
  const CafeMenu({super.key});

  @override
  State<CafeMenu> createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: TextButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
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
            bottom: const TabBar(
              tabs: [
                Tab(
                  
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'M',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'T',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'W',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'T',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'F',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'S',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'S',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: ColorAssets.bduColor,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'BiT Connect',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 1
                  },
                ),
                ListTile(
                  leading: Icon(Icons.category_sharp),
                  title: Text(
                    'Cafe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(
                    'Lounge',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                ListTile(
                  leading: Icon(Icons.book_rounded),
                  title: Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info_outlined),
                  title: Text(
                    'Departments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    child: ListTile(
                      tileColor: ColorAssets.secondaryYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Implement logout logic
                        exit(0);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
         
        ),
      ),
    );
  }
}
