import 'package:bit_connect/presentation/sims/components/title.dart';
import 'package:bit_connect/searvices/data/dev_profile.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class DevList extends StatelessWidget {
  const DevList({super.key});

  Widget header(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: title(context, 'Developers'),
    );
  }

  Widget name(name) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget link(link, isG) {
    return isG
        ? IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.face,
            ),
          )
        : IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.facebook,
            ),
          );
  }

  Widget about(links) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: [
          link(links[0], false),
          link(links[1], true),
        ],
      ),
    );
  }

  Widget profileImg(imgUrl) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, -5),
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 2,
          ),
          BoxShadow(
            offset: Offset(5, 5),
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
    );
  }

  Widget profileName(devName, links) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          name(devName),
          about(['abc.com', 'abc.com']),
        ],
      ),
    );
  }

  Widget devProfile(context, index, dev) {
    print(dev);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, -5),
              color: Colors.white,
              blurRadius: 18,
            ),
            BoxShadow(
              offset: Offset(5, 5),
              color: Colors.black38,
              blurRadius: 18,
            )
          ],
        ),
        child: SizedBox(
          width: getWidth(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: index % 2 == 0
                ? [
                    profileImg(dev['imgUrl']),
                    profileName(
                      dev['name'],
                      [
                        dev['linkedin'],
                        dev['github'],
                      ],
                    ),
                  ]
                : [
                    profileName(
                      dev['name'],
                      [
                        dev['linkedin'],
                        dev['github'],
                      ],
                    ),
                    profileImg(dev['imgUrl']),
                  ],
          ),
        ),
      ),
    );
  }

  Widget yearOfDev(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Container(
            width: getWidth(context),
            height: 1,
            color: Colors.black26,
          ),
          const Text(
            '2016 E.C',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '4th year software engineering students',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> devList = devLIst;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'bit-connect',
          style: TextStyle(fontSize: 13),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(context),
              SingleChildScrollView(
                child: Column(
                    children: devList
                        .map((dev) =>
                            devProfile(context, devList.indexOf(dev), dev))
                        .toList()),
              ),
              yearOfDev(context),
            ],
          ),
        ),
      ),
    );
  }
}
