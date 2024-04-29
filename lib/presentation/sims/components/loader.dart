import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';

Widget loader() {
  return Center(
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          width: 50,
          height: 50,
          child: const CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: ColorAssets.bduColor,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'For good reason, It may take a few seconds',
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w300,
            ),
          ),
        )
      ],
    ),
  );
}
