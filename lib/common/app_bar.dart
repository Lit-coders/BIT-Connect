import 'package:bit_connect/presentation/location/components/app_bar.dart';
import 'package:bit_connect/presentation/user_profile/new_user_profile.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    leading: TextButton(
      onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      },
      child: Image.asset(
        'assets/icons/menu.png',
        height: PaddingConstant.forPersonIcon,
        color: ColorAssets.bduColor,
        width: 30,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          // Handle person button press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuildProfile.personIcon()),
          );
        },
        icon: Image.asset(
          'assets/icons/person.png',
          height: PaddingConstant.forPersonIcon,
          color: ColorAssets.bduColor,
          width: 30,
        ),
      ),
    ],
  );
}

PreferredSize appBarChooser(int contentIdx, BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey) {
  if (contentIdx == 1) {
    return PreferredSize(
      preferredSize: Size(getWidth(context), 50),
      child: customAppBar(context, scaffoldKey, 'GPA Calculator'),
    );
  } else if (contentIdx == 2) {
    return PreferredSize(
      preferredSize: Size(getWidth(context), 80),
      child: const LocationAppBar(),
    );
  } else {
    return PreferredSize(
      preferredSize: Size(getWidth(context), 50),
      child: customAppBar(context, scaffoldKey, "General Status"),
    );
  }
}
