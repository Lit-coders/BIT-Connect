import 'package:flutter/material.dart';

class LoadingSpinner {
  // loading spinner
  static Future<dynamic> load(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: Colors.blue,
            backgroundColor: Colors.white24,
          ),
        );
      },
    );
  }
}
