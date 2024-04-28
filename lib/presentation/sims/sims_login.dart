import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SIMSLogin {
  static Future<void> showSIMSLogin(context) async {
    final simsProvider = Provider.of<SIMSProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign In | BiT SIMS'),
          content: const Text('login first'),
          actions: [
            TextButton(
              onPressed: () {
                simsProvider.cancelLogin();
                Navigator.pop(context);
              },
              child: const Text('cancel'),
            )
          ],
        );
      },
    );
  }
}
