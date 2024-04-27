import 'package:bit_connect/presentation/news/components/news_detail.dart';
import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsSlide extends StatefulWidget {
  const NewsSlide({super.key});

  @override
  State<NewsSlide> createState() => _NewsSlideState();
}

class _NewsSlideState extends State<NewsSlide> {
  @override
  Widget build(BuildContext context) {
    final newsModel = Provider.of<NewsModel>(context, listen: false);
    final topNews = newsModel.newsList.sublist(0, 3);
    return CarouselSlider(
      options: CarouselOptions(
        height: 160.0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
      ),
      items: topNews.map((Map<String, dynamic> slide) {
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
                  image: DecorationImage(
                    image: AssetImage(slide['img']),
                    fit: BoxFit.cover,
                    opacity: 0.8,
                  ),
                  border: Border.all(color: ColorAssets.bduColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(174, 144, 202, 249),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          slide['title'],
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(174, 144, 202, 249),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.black54,
                            ),
                            Text(
                              getNewsAge(slide['uploadTime']),
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
