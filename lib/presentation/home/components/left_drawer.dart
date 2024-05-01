import 'package:bit_connect/presentation/cafe_menu/cafe.dart';
import 'package:bit_connect/presentation/home/components/developers_list.dart';
import 'package:bit_connect/presentation/home/components/drawer_tile.dart';
import 'package:bit_connect/presentation/home/home_screen.dart';
import 'package:bit_connect/presentation/location/location_screen.dart';
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
          drawerTile(
              "Home",
              Icons.home,
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()))
                  }),
          drawerTile(
              "Cafe",
              Icons.food_bank_rounded,
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CafeMenu())),
                  }),
          drawerTile(
              "Location",
              Icons.place,
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Location())),
                  }),
          drawerTile(
              "Developers",
              Icons.developer_mode,
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DevList())),
                  }),

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
