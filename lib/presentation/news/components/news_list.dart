import 'package:bit_connect/presentation/news/components/news_age.dart';
import 'package:bit_connect/presentation/news/components/news_detail.dart';
import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final searchModel = Provider.of<NewsModel>(context, listen: false);
    final allNews = searchModel.newsList;
    return ListView.builder(
      itemCount: allNews.length,
      itemBuilder: (context, index) {
        final news = allNews[index];
        final uploadTime = getNewsAge(news['uploadTime']);

        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsDetail(news: news),
            ),
          ),
          child: Card(
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
                            allNews[index]['title'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          NewsAge(uploadTime: uploadTime),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}