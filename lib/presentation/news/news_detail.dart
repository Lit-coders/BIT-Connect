import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  Map<String, dynamic> news;

  NewsDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: getHeight(context),
              width: getWidth(context),
              decoration: BoxDecoration(
                color: const Color.fromARGB(200, 2, 53, 95),
                image: DecorationImage(
                  image: AssetImage(
                    news['img'],
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: PreferredSize(
                preferredSize: Size(getWidth(context), 40),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(5),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: getHeight(context) * 3 / 4,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: getWidth(context),
                      child: Text(
                        news['title'],
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 252, 252),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.timer,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      news['uploadTime']
                                          .toDate()
                                          .toLocal()
                                          .toString()
                                          .split(" ")
                                          .toList()[0],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Text(
                                  news['detail'],
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
