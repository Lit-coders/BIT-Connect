import 'package:bit_connect/presentation/sims/components/sims_login.dart';
import 'package:bit_connect/presentation/sims/components/sims_webView.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SIMS extends StatefulWidget {
  const SIMS({super.key});

  @override
  State<SIMS> createState() => _SIMSState();
}

class _SIMSState extends State<SIMS> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SIMSProvider>(
      builder: ((context, simsProvider, child) {
        return Scaffold(
          body: simsProvider.isStatusWithLogin
              ? const SIMSLogin()
              : const SIMSWebView(),
        );
      }),
    );
  }
}
