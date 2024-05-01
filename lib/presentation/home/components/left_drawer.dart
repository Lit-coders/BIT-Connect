import 'package:bit_connect/presentation/home/components/drawer_tile.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const Image(
                    image: AssetImage("assets/icons/ic_launcher.png"),
                    height: 80,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'BiT Connect',
                  style: TextStyle(
                      color: ColorAssets.bduColor,
                      fontSize: 24,
                      fontFamily: 'Pacifico'),
                ),
              ],
            ),
          ),
          drawerTile("Home", Icons.home, () => null),
          drawerTile("Cafe", Icons.category_sharp, () => null),
          drawerTile("Location", Icons.book_rounded, () => null),
          drawerTile("Developers", Icons.developer_mode, () => null),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: ColorAssets.bduColor,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorAssets.bduColor),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ),

          // Add more ListTile widgets for additional menu items
        ],
      ),
    );
  }
}
