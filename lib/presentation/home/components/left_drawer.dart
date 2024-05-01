import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    color: Colors.white, fontSize: 24, fontFamily: 'Poppins'),
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
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ),

          // Add more ListTile widgets for additional menu items
        ],
      ),
    );
  }
}
