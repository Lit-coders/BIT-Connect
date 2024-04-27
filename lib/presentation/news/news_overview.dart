import 'package:bit_connect/presentation/auth/components/error_snack_bar.dart';
import 'package:bit_connect/presentation/home/components/user_welcomer.dart';
import 'package:bit_connect/presentation/news/components/news_list.dart';
import 'package:bit_connect/presentation/news/components/news_slide.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsOverview extends StatefulWidget {
  const NewsOverview({super.key});

  @override
  State<NewsOverview> createState() => _NewsOverviewState();
}

class _NewsOverviewState extends State<NewsOverview> {
  final CollectionReference news =
      FirebaseFirestore.instance.collection('news');

  Future<List<Map<String, dynamic>>> getNews() async {
    List<Map<String, dynamic>> newses = [];
    try {
      final QuerySnapshot snapshot =
          await news.orderBy('uploadDate', descending: true).get();
      for (var doc in snapshot.docs) {
        newses.add(doc.data() as Map<String, dynamic>);
      }
      return newses;
    } catch (e) {
      final errorSnackBar =
          ErrorSnackBar(content: 'Unable to fetch news, pleas try again');
      if (mounted) errorSnackBar.getSnackBar();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorAssets.bduColor,
                backgroundColor: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else if (snapshot.hasData) {
            final newsList = snapshot.requireData;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: PreferredSize(
                    preferredSize: Size(getWidth(context), 100),
                    child: const UserWelcomer(),
                  ),
                ),
                NewsSlide(newsList: newsList),
                Container(
                  width: getWidth(context),
                  padding: const EdgeInsets.all(8.0),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingConstant.horizontalPadding),
                    child: Text(
                      "News",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                ),
                Expanded(
                  child: NewsList(newsList: newsList),
                )
              ],
            );
          }
          return const Center();
        },
      ),
    );
  }
}
