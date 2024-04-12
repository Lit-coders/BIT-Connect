import 'package:flutter/material.dart';

class LocationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LocationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const ListTile(
        title: Text("Hi, XYZ"),
        subtitle: Text("what do you want to explore today?"),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size(const Size.fromWidth(kToolbarHeight).width, 200);
}
