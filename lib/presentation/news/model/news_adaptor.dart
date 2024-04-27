import 'dart:math';

import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class NewsAdaptor extends TypeAdapter<NewsModel> {
  @override
  NewsModel read(BinaryReader reader) {
    final title = reader.readString();
    final detail = reader.readString();
    final uploadDate =
        Timestamp(reader.readInt(), (reader.readInt() * (pow(10, 9))).toInt());
    final imgUrl = reader.readString();

    return NewsModel(
      title: title,
      detail: detail,
      uploadDate: uploadDate,
      imgUrl: imgUrl,
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => throw UnimplementedError();

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer.write(obj.title.toString());
    writer.write(obj.detail.toString());
    writer.write(obj.uploadDate.seconds.toInt());
    writer.write(obj.imgUrl.toString());
  }
}
