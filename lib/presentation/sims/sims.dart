import 'package:bit_connect/presentation/sims/components/sims_login.dart';
import 'package:bit_connect/presentation/sims/components/sims_stauts.dart';
import 'package:bit_connect/presentation/sims/components/sims_webView.dart';
import 'package:bit_connect/presentation/sims/helpers/sims_helpers.dart';
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
        initializeLoginPreference(simsProvider);
        if (simsProvider.isUserLoggedInBefore) {
          return const SIMSStatus();
        }
        return Scaffold(
          body: simsProvider.isStatusWithLogin
              ? const SIMSLogin()
              : const SIMSWebView(),
        );
      }),
    );
  }
}
