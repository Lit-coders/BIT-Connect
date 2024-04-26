import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(context, scaffoldKey) {
  return AppBar(
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
  );
}
