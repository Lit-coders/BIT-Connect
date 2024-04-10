import 'dart:io';

import 'package:bit_connect/utils/constants/colorAssets.dart';
import 'package:bit_connect/utils/constants/padConstants.dart';
import 'package:flutter/material.dart';

class StudentClubs extends StatefulWidget {
  const StudentClubs({Key? key}) : super(key: key);

  @override
  State<StudentClubs> createState() => _StudentClubsState();
}

class _StudentClubsState extends State<StudentClubs> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: ColorAssets.bduColor,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'BiT Connect',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Pacifico'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Implement action for item 1
                },
              ),
              ListTile(
                leading: Icon(Icons.category_sharp),
                title: const Text(
                  'Cafe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Implement action for item 2
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: const Text(
                  'Lounge',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Implement action for item 2
                },
              ),
              ListTile(
                leading: Icon(Icons.book_rounded),
                title: const Text(
                  'Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Implement action for item 2
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outlined),
                title: const Text(
                  'Departments',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                    title: const Text(
                      textAlign: TextAlign.center,
                      'Logout',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    onTap: () {
                      // Implement logout logic
                      exit(0);
                    },
                  ),
                ),
              ),

              // Add more ListTile widgets for additional menu items
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              TextButton(
                
                onPressed: () {
                  showModalBottomSheet(
                      context: _scaffoldKey
                          .currentContext!, // Use the context from the parent Scaffold
                      backgroundColor: ColorAssets.secondaryYellow,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 400,
                          child: Container(
                            child: Text('Trial'),
                          ),
                        );
                      });
                },

                child: Center(
                  child: Container(
                    width: 350,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: ColorAssets.bduColor,
                          width: 4), // Add border color
                      // boxShadow:
                    ),
                    child: Material(
                      elevation: 8,
                      shadowColor: ColorAssets.bduColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        title: const Text("RDL"),
                        tileColor: ColorAssets.white,
                        onTap: () {},
                        leading: Image.asset('assets/stclubs/club1.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
