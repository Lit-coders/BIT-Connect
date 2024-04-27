import 'package:bit_connect/presentation/news/news_detail.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        height: 160.0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
      ),
      items: [
        {
          'title': 'Who deserves A+? answer this and you will get A+',
          'detail':
              'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
          'uploadTime': Timestamp.now(),
          'img': 'assets/lunchtime.png',
        },
        {
          'title': 'Who deserves A+?',
          'detail':
              'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
          'uploadTime': Timestamp.now(),
          'img': 'assets/bdu.png',
        },
        {
          'title':
              'Scientists Discover New Programming Language Based on Cat Meows!',
          'detail':
              'In a groundbreaking discovery, researchers have unveiled a new programming language inspired by the subtle nuances of cat communication. Dubbed "MeowScript," this feline-inspired language promises to revolutionize the way developers write code, with syntax and semantics based entirely on the various meows, purrs, and hisses of our furry friends. According to Dr. Whiskers, the lead researcher behind the project, MeowScript was developed after years of studying cat behavior and vocalizations. "We noticed that cats have an incredibly complex language of their own, and we wanted to harness that power for programming," Dr. Whiskers explained. "MeowScript allows developers to express their code using the rich vocabulary of feline sounds, making programming more intuitive and, dare I say, purr-fectly delightful!',
          'uploadTime': Timestamp.now(),
          'img': 'assets/bdu.png',
        }
      ].map((Map<String, dynamic> slide) {
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
                              slide['uploadTime']
                                  .toDate()
                                  .toLocal()
                                  .toString()
                                  .split(" ")
                                  .toList()[0],
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
