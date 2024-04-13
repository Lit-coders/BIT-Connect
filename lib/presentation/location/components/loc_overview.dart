import 'package:flutter/material.dart';

class LocOverview extends StatelessWidget {
  const LocOverview({super.key});

  Widget getOverviewItem(title, color) {
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
            width: 50,
            height: 50,
            color: color,
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
          getOverviewItem('Offices', Colors.red),
          getOverviewItem('Facilities', Colors.yellow),
          getOverviewItem('Distances', Colors.green),
        ],
      ),
    );
  }
}
