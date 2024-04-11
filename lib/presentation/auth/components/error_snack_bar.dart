import 'package:flutter/material.dart';

class ErrorSnackBar {
  final String content;
  ErrorSnackBar({required this.content});

  SnackBar getSnackBar() {
    return SnackBar(
      content: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 300,
        left: 20,
        right: 20,
      ),
      backgroundColor: Colors.blue,
    );
  }
}
