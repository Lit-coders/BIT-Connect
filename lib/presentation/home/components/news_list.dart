import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key});
  final List<Map<String, dynamic>> newsList = [
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
      'title': 'Who deserves A+?',
      'detail':
          'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
      'uploadTime': Timestamp.now(),
      'img': 'assets/logo.png',
    },
    {
      'title': 'Who deserves A+?',
      'detail':
          'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
      'uploadTime': Timestamp.now(),
      'img': 'assets/logo.png',
    },
    {
      'title': 'Who deserves A+?',
      'detail':
          'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
      'uploadTime': Timestamp.now(),
      'img': 'assets/logo.png',
    },
    {
      'title': 'Who deserves A+?',
      'detail':
          'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
      'uploadTime': Timestamp.now(),
      'img': 'assets/logo.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];
        final Timestamp uploadTime = news['uploadTime'];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage(
                      news['img'],
                    ),
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 90,
                    padding: const EdgeInsets.only(left: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          newsList[index]['title'],
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.black38,
                            ),
                            Text(
                              uploadTime
                                  .toDate()
                                  .toLocal()
                                  .toString()
                                  .split(" ")
                                  .toList()[0],
                              style: const TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}