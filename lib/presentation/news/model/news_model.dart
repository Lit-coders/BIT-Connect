import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  String title;
  String detail;
  Timestamp uploadDate;
  String imgUrl;

  NewsModel({
    required this.title,
    required this.detail,
    required this.uploadDate,
    required this.imgUrl,
  });
}
