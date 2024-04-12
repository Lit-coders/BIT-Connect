import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsSlide extends StatefulWidget {
  const NewsSlide({super.key});

  @override
  State<NewsSlide> createState() => _NewsSlideState();
}

class _NewsSlideState extends State<NewsSlide> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
      ),
      items: [
        ["Welcome to BiT,", "Hey, LitCoders"],
        ["News Poli", "Hot News"],
        // Add more slides as needed
      ].map((slide) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bdu.png'),
                  fit: BoxFit.cover,
                  // Adjust the fit as needed
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      slide[1],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: ColorAssets.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      slide[0],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
