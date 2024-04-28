import 'package:bit_connect/presentation/home/components/user_welcomer.dart';
import 'package:bit_connect/presentation/news/components/news_list.dart';
import 'package:bit_connect/presentation/news/components/news_slide.dart';
import 'package:bit_connect/presentation/news/data/news_data.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class NewsOverview extends StatefulWidget {
  const NewsOverview({super.key});

  @override
  State<NewsOverview> createState() => _NewsOverviewState();
}

class _NewsOverviewState extends State<NewsOverview> {
  Future<void> refresh() async {
    setState(() {});
    await refreshNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refresh(),
      child: SafeArea(
        child: FutureBuilder(
          future: getCatchNews(),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
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
      ),
    );
  }
}
