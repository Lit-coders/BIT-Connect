import 'package:flutter/material.dart';

class SIMS extends StatefulWidget {
  const SIMS({super.key});

  @override
  State<SIMS> createState() => _SIMSState();
}

class _SIMSState extends State<SIMS> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Text("abc"),
        ],
      ),
    );
  }
}
