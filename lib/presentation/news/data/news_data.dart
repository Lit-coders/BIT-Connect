import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

final CollectionReference news = FirebaseFirestore.instance.collection('news');
final newsBox = Hive.box<NewsModel>('newsBox');

// retrieve data from firestore
Future<void> retrieveAndCatchNews() async {
  final List<NewsModel> newsModels = [];

  try {
    final QuerySnapshot snapshot =
        await news.orderBy('uploadDate', descending: true).get();

    for (var doc in snapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      newsModels.add(
        NewsModel(
          title: data['title'],
          detail: data['detail'],
          uploadDate: data['uploadDate'],
          imgUrl: data['imgUrl'],
        ),
      );
    }
    catchNews(newsModels);
  } catch (e) {
    catchNews([]);
  }
}

// store data to Hive box
Future<void> catchNews(List<NewsModel> newsModels) async {
  if (newsModels.isEmpty) {
    print('no news is fetched');
    return;
  } else {
    print('fetched: ${newsModels.length}');

    newsBox.clear();
    newsBox.addAll(newsModels);
  }
}

// retrieve box data

Future<List<NewsModel>> getCatchNews() async {
  await retrieveAndCatchNews();
  return newsBox.values.toList();
}
