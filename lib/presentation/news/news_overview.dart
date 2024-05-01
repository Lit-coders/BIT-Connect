import 'package:bit_connect/presentation/home/components/user_welcomer.dart';
import 'package:bit_connect/presentation/news/components/news_slide.dart';
import 'package:bit_connect/presentation/news/data/news_data.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:bit_connect/presentation/news/components/news_list.dart';


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
                    padding: const EdgeInsets.only(left: 40, bottom: 12.0),
                    child: PreferredSize(
                      preferredSize: Size(getWidth(context), 100),
                      child: const UserWelcomer(),
                    ),
                  ),
                  NewsSlide(newsList: newsList),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: getWidth(context),
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: PaddingConstant.horizontalPadding),
                      child: Text(
                        "Latest News and Events",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NewsList(),
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
