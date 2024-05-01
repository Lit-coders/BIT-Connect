import 'package:bit_connect/presentation/news/components/news_age.dart';
import 'package:bit_connect/presentation/news/components/news_detail.dart';
import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<NewsModel> newsList;

  const NewsList({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];
        final uploadTime = getNewsAge(news.uploadDate);

        return InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsDetail(news: news),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 30.0,
                    offset: Offset(-10, -10),
                    color: Color.fromARGB(41, 198, 198, 198),
                  ),
                  BoxShadow(
                    blurRadius: 30.0,
                    offset: Offset(10, 10),
                    color: Color.fromARGB(41, 198, 198, 198),
                  )
                ]),
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
                        news.imgUrl,
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
                            news.title,
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
