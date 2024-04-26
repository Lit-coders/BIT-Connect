import 'dart:io';

import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class StudentClubs extends StatefulWidget {
  const StudentClubs({super.key});

  @override
  State<StudentClubs> createState() => _StudentClubsState();
}

class _StudentClubsState extends State<StudentClubs> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
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
                leading: const Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Implement action for item 1
                },
              ),
              ListTile(
                leading: const Icon(Icons.category_sharp),
                title: const Text(
                  'Cafe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Implement action for item 2
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text(
                  'Lounge',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  // Implement action for item 2
                },
              ),
              ListTile(
                leading: const Icon(Icons.book_rounded),
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
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    showModalBottomSheet(
<<<<<<< HEAD:lib/presentation/studentclubs/studentClubs.dart
                        backgroundColor: Color.fromARGB(255, 0, 120, 225),
=======
                        backgroundColor: const Color.fromARGB(255, 0, 120, 225),
>>>>>>> 8d3ed9e951c726a36b2e3474de1672ea12b410b4:lib/presentation/student_clubs/student_clubs.dart
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
<<<<<<< HEAD:lib/presentation/studentclubs/studentClubs.dart
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView(children: const [
                                  Text('Trial'),
                                ]),
                              ),
                            ),
=======
                            child: const Text('Trial'),
>>>>>>> 8d3ed9e951c726a36b2e3474de1672ea12b410b4:lib/presentation/student_clubs/student_clubs.dart
                          );
                        },
                        context: Navigator.of(context).context);
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
<<<<<<< HEAD:lib/presentation/studentclubs/studentClubs.dart
                          contentPadding: EdgeInsets.all(8),
=======
                          contentPadding: const EdgeInsets.all(8),
>>>>>>> 8d3ed9e951c726a36b2e3474de1672ea12b410b4:lib/presentation/student_clubs/student_clubs.dart
                          title: const Text("RDL"),
                          tileColor: ColorAssets.white,
                          onTap: () {},
                          leading: Image.asset('assets/stclubs/club1.png'),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
