import 'package:flutter/material.dart';

class LocOverview extends StatelessWidget {
  const LocOverview({super.key});

  Widget getOverviewItem(title, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 25,
            ),
            transform: Matrix4.rotationZ(3.14 / 180 * 45),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 50,
            height: 50,
            child: Center(
              child: Icon(icon),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getOverviewItem('Offices', Icons.build),
          getOverviewItem('Facilities', Icons.data_array),
          getOverviewItem('Distances', Icons.social_distance),
        ],
      ),
    );
  }
}
