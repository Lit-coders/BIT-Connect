import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CafeMenu extends StatefulWidget {
  CafeMenu({super.key});
  @override
  State<CafeMenu> createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
  late List<Map<String, dynamic>> _menuList;
  final List<String> tabTitle = ['M', "T", 'W', 'T', 'F', 'S', 'S'];

  @override
  void initState() {
    super.initState();
    _fetchMenu();
  }

  Future<void> _fetchMenu() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('cafe').get();
    _menuList = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
        length: _menuList.length,
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
            bottom:  TabBar(
              indicatorWeight: 10,
              isScrollable: true,
              indicatorColor: ColorAssets.secondaryYellow,
              tabs: [
                for (var title in tabTitle)
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                       Text(
                        title,
                        style: const TextStyle(
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
          // body: TabBarView(
          //   children: <Widget>[
          //     _buildListViewMenu('M'),
          //     _buildListViewMenu('T'),
          //     _buildListViewMenu('W'),
          //     _buildListViewMenu('T'),
          //     _buildListViewMenu('F'),
          //     _buildListViewMenu('S'),
          //     _buildListViewMenu('S')
          //   ],
          // ),

          body:  TabBarView(
            children: [
              for (var menu in _menuList)
              TabContent(
                breakfast: menu['breakfast'],
                lunch: menu['lunch'],
                dinner: menu['dinner'],
              ),
            ],
          ),
        ),
      );
  }
}

// }

class TabContent extends StatelessWidget {
  // final String title;
  // final String image;
  // final String name;
  final Map<String,String> breakfast;
  final Map<String,String> lunch;
  final Map<String,String> dinner;


  const TabContent({
    super.key,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  @override
  Widget build(BuildContext context) {
  List<Map<String,String>> noOfMeal = [breakfast,lunch,dinner];
    return Center(
      child: ListView(children: [
        for (var meal in noOfMeal) 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(meal['title']!, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            Image.network(meal['image']!,
                width: 380, height: 200), // Use your own image assets
            const SizedBox(height: 16),
            Text(meal['name']!, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ]),
    );
  }
}
