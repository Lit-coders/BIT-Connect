import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

Widget line(isLeft, context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: isLeft ? Alignment.centerRight : Alignment.centerLeft,
        end: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        colors: const [
          Color.fromARGB(255, 0, 33, 61),
          Color.fromARGB(32, 0, 33, 61)
        ],
      ),
    ),
    width: getWidth(context) * 2 / 9,
    height: 1,
    margin: const EdgeInsets.symmetric(horizontal: 7),
  );
}
