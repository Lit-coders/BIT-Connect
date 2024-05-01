import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';

class HomePageOptions extends StatelessWidget {
  final String name;
  final String iconPath;

  const HomePageOptions(
      {super.key, required this.name, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 248, 225),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //icon
            Image.asset(
              iconPath,
              height: 35,
              color: ColorAssets.white,
            ),
            //name
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: ColorAssets.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
