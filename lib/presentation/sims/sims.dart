import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SIMS extends StatefulWidget {
  bool isWebView;

  SIMS({super.key, required this.isWebView});

  @override
  State<SIMS> createState() => _SIMSState();
}

class _SIMSState extends State<SIMS> {
  late final WebViewController controller;

  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://bdu.edu.et/'),
      );
  }

  Widget bitWebView() {
    return Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }

  Widget userData() {
    return const Center(
      child: Text("User Data"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.isWebView ? bitWebView() : userData(),
    );
  }
}
