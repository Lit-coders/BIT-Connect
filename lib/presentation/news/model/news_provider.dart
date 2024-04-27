import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> newsList = [];
  final CollectionReference news =
      FirebaseFirestore.instance.collection('news');

  void initializeNewsList(news) async {
    newsList = news;
    notifyListeners();
  }
}

    // newsList = [
    //   {
    //     'title': 'Who deserves A+? answer this and you will get A+',
    //     'detail':
    //         'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
    //     'uploadTime': Timestamp.now(),
    //     'img': 'assets/lunchtime.png',
    //   },
    //   {
    //     'title':
    //         'Scientists Discover New Programming Language Based on Cat Meows!',
    //     'detail':
    //         'In a groundbreaking discovery, researchers have unveiled a new programming language inspired by the subtle nuances of cat communication. Dubbed "MeowScript," this feline-inspired language promises to revolutionize the way developers write code, with syntax and semantics based entirely on the various meows, purrs, and hisses of our furry friends. According to Dr. Whiskers, the lead researcher behind the project, MeowScript was developed after years of studying cat behavior and vocalizations. "We noticed that cats have an incredibly complex language of their own, and we wanted to harness that power for programming," Dr. Whiskers explained. "MeowScript allows developers to express their code using the rich vocabulary of feline sounds, making programming more intuitive and, dare I say, purr-fectly delightful!',
    //     'uploadTime': Timestamp.now(),
    //     'img': 'assets/bdu.png',
    //   },
    //   {
    //     'title': 'Who deserves A+?',
    //     'detail':
    //         'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
    //     'uploadTime': Timestamp.now(),
    //     'img': 'assets/bdu.png',
    //   },
    //   {
    //     'title': 'Who deserves A+?',
    //     'detail':
    //         'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
    //     'uploadTime': Timestamp.now(),
    //     'img': 'assets/logo.png',
    //   },
    //   {
    //     'title': 'Who deserves A+?',
    //     'detail':
    //         'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
    //     'uploadTime': Timestamp.now(),
    //     'img': 'assets/logo.png',
    //   },
    //   {
    //     'title': 'Who deserves A+?',
    //     'detail':
    //         'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
    //     'uploadTime': Timestamp.now(),
    //     'img': 'assets/logo.png',
    //   },
    //   {
    //     'title': 'Who deserves A+?',
    //     'detail':
    //         'the question is not how to get A+, it is who really deserves it. who really deserves it than Gash Dimamu!?',
    //     'uploadTime': Timestamp.now(),
    //     'img': 'assets/logo.png',
    //   }
    // ];