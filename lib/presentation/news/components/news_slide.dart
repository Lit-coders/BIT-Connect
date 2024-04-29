import 'package:bit_connect/presentation/news/components/news_detail.dart';
import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsSlide extends StatelessWidget {
  final List<NewsModel> newsList;

  const NewsSlide({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    final topNews = newsList.length > 3 ? newsList.sublist(0, 3) : newsList;

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
      items: topNews.map((NewsModel slide) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsDetail(news: slide),
                ),
              ),
              child: Container(
                  width: getWidth(context),
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 30.0,
                        offset: Offset(-10, -10),
                        color: Color.fromARGB(41, 201, 133, 163),
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage(slide.imgUrl),
                      fit: BoxFit.cover,
                      opacity: 0.8,
                    ),
                    // border: Border.all(color: ColorAssets.bduColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                            colors: [Colors.transparent, ColorAssets.bduColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slide.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                getNewsAge(slide.uploadDate),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ))),
            );
          },
        );
      }).toList(),
    );
  }
}
