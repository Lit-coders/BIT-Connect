import 'package:bit_connect/constants/colorAssets.dart';
import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';




class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.bduColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: ColorAssets.bduColor,
        items: [
          CurvedNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: "Home"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.location_on, size: 30), label: "Sites"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.food_bank_sharp, size: 30), label: "Cafe"),
          CurvedNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: "User"),
        ],
      ),
    );
  }
}
