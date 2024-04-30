import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SIMSWebView extends StatefulWidget {
  const SIMSWebView({super.key});

  @override
  State<SIMSWebView> createState() => _SIMSWebViewState();
}

class _SIMSWebViewState extends State<SIMSWebView> {
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
    return SizedBox(
      width: getWidth(context),
      height: getHeight(context),
      child: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }

  Widget backButton(SIMSProvider simsProvider) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(2),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 18,
            color: Colors.black26,
            offset: Offset(-1, 1),
          )
        ]),
        child: IconButton(
          onPressed: () => simsProvider.setIsStatusWithLogin(true),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            elevation: MaterialStatePropertyAll(2),
          ),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, SIMSProvider simsProvider, child) {
        return SizedBox(
          width: getWidth(context),
          height: getHeight(context),
          child: Stack(
            children: [
              bitWebView(),
              backButton(simsProvider),
            ],
          ),
        );
      }),
    );
  }
}
