import 'package:flutter/material.dart';

Widget line(isLeft, context) {
  return Expanded(
    child: Container(
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
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 7),
    ),
  );
}

Widget title(context, title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line(true, context),
        Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 33, 61),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        line(false, context)
      ],
    ),
  );
}
