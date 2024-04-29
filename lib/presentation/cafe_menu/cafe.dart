import 'dart:io';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';

// class CafeModel {
//   final String kurs;
//   final String misa;
//   final String rat;

//   const cafemodel(){
//     required this. kurs;
//     this .misa;
//     this.rat;
//   }
// }

class CafeMenu extends StatefulWidget {
  get firestoreInstance => null;

  void listCafeMenu(){
    var result;
    firestoreInstance.collection("cafe").get().then((value)=>{
      value.docs.forEach(result)});
  }
  CafeMenu({super.key});
  final List<String> tabTitle = ['M', "T", 'W', 'T', 'F', 'S', 'S'];
  @override
  State<CafeMenu> createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: TextButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Image.asset(
                'assets/icons/menu.png',
                height: PaddingConstant.forPersonIcon,
                color: ColorAssets.bduColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // Handle person button press
                },
                icon: Image.asset(
                  'assets/icons/person.png',
                  height: PaddingConstant.forPersonIcon,
                  color: ColorAssets.bduColor,
                ),
              ),
            ],
            bottom: const TabBar(
              indicatorWeight: 10,
              isScrollable: true,
              indicatorColor: ColorAssets.secondaryYellow,
              tabs: [
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'M',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'T',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'W',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'T',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'F',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'S',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'S',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorAssets.bduColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // Contents of Tab 1
              TabContent(
                title: 'Food 1',
                image: 'assets/menu1.png',
                name: 'Firfir Be Dabo be Shay',
              ),
              // Contents of Tab 2
              TabContent(
                title: 'Food 2',
                image: 'assets/menu1.png',
                name: 'Food Name 2',
              ),
              // Contents of Tab 3
              TabContent(
                title: 'Food 3',
                image: 'assets/menu1.png',
                name: 'Food Name 3',
              ),
              TabContent(
                title: 'Food 3',
                image: 'assets/menu1.png',
                name: 'Food Name 3',
              ),
              TabContent(
                title: 'Food 3',
                image: 'assets/menu1.png',
                name: 'Food Name 3',
              ),
              TabContent(
                title: 'Food 3',
                image: 'assets/menu1.png',
                name: 'Food Name 3',
              ),
              TabContent(
                title: 'Food 3',
                image: 'assets/menu1.png',
                name: 'Food Name 3',
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: ColorAssets.bduColor,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'BiT Connect',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 1
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.category_sharp),
                  title: const Text(
                    'Cafe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text(
                    'Lounge',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book_rounded),
                  title: const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_outlined),
                  title: const Text(
                    'Departments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Implement action for item 2
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    child: ListTile(
                      tileColor: ColorAssets.secondaryYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: const Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Implement logout logic
                        exit(0);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// }

class TabContent extends StatelessWidget {
  final String title;
  final String image;
  final String name;

  const TabContent({
    super.key,
    required this.title,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 24, fontFamily: 'Poppins')),
            const SizedBox(height: 16),
            Image.asset(image,
                width: 380, height: 200), // Use your own image assets
            const SizedBox(height: 16),
            Text(name,
                style: const TextStyle(fontSize: 18, fontFamily: 'Poppins')),
            Text(title,
                style: const TextStyle(fontSize: 24, fontFamily: 'Poppins')),
            const SizedBox(height: 16),
            Image.asset(image,
                width: 380, height: 200), // Use your own image assets
            const SizedBox(height: 16),
            Text(name,
                style: const TextStyle(fontSize: 18, fontFamily: 'Poppins')),
            Text(title,
                style: const TextStyle(fontSize: 24, fontFamily: 'Poppins')),
            const SizedBox(height: 16),
            Image.asset(image,
                width: 380, height: 200), // Use your own image assets
            const SizedBox(height: 16),
            Text(name,
                style: const TextStyle(fontSize: 18, fontFamily: 'Poppins')),
          ],
        ),
      ]),
    );
  }
}
