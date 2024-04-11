import 'package:bit_connect/presentation/home.dart';
import 'package:bit_connect/presentation/onboarding/content_model.dart';
import 'package:bit_connect/utils/constants/colorAssets.dart';
import 'package:flutter/material.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});
  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int _currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDotTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Image.asset(
                            contents[i].image,
                            height: 250,
                          ),
                        ),
                        const SizedBox(height: 60),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contents[i].discription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            height: 60,
            margin: const EdgeInsets.only(
                bottom: 100, left: 40, right: 40, top: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorAssets.bduColor,
            ),
            child: TextButton(
              child: Text(
                _currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: const TextStyle(
                  fontSize: 18,
                  color: ColorAssets.white,
                ),
              ),
              onPressed: () {
                if (_currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Home(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
              },
            ),
          ),
          // )
        ],
      ),
    );
  }

  GestureDetector buildDot(int index, BuildContext context) {
    return GestureDetector(
        onTap: () => _onDotTapped(index),
        child: Container(
          height: 10,
          width: _currentIndex == index ? 25 : 10,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorAssets.bduColor,
          ),
        ));
  }
}
