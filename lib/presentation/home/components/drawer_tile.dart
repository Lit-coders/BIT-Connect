import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';

ListTile drawerTile(String title, IconData icon, Function() onTap) {
  return ListTile(
    leading: Icon(
      icon,
      color: ColorAssets.bduColor,
    ),
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ColorAssets.bduColor),
    ),
    onTap: onTap,
  );
}
