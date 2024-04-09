import 'dart:io';
import 'package:bit_connect/utils/constants/colorAssets.dart';
import 'package:bit_connect/utils/constants/padConstants.dart';
import 'package:flutter/material.dart';

class CafeMenu extends StatefulWidget {
  const CafeMenu({super.key});

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
          body: TabBarView(
            children: <Widget>[
              _buildListViewMenu('M'),
              _buildListViewMenu('T'),
              _buildListViewMenu('W'),
              _buildListViewMenu('T'),
              _buildListViewMenu('F'),
              _buildListViewMenu('S'),
              _buildListViewMenu('S')
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
ListView _buildListViewMenu(String s) {

  return ListView.builder(
    itemBuilder: (context, index) => ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$s $index', // Example text, replace with your description
            style: const TextStyle(
              fontSize: 16, // Adjust font size as needed
              fontWeight: FontWeight.bold, // Adjust font weight as needed
            ),
          ),
          const SizedBox(height: 5), // Adjust spacing between text and image
          Image.asset(
            'assets/images/menu_item_$index.png', // Replace with your image path
            width: 100, // Adjust width as needed
            height: 100, // Adjust height as needed
            fit: BoxFit.cover, // Adjust fit as needed
          ),
          const SizedBox(height: 5), // Adjust spacing between image and text
          Text(
            'Description of item $index', // Example description, replace with your actual descriptions
            style: const TextStyle(
              fontSize: 14, // Adjust font size as needed
            ),
          ),
        ],
      ),
      onTap: () {
        // Handle item tap
      },
    ),
  );
}
