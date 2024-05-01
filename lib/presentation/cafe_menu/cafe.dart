import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:bit_connect/utils/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CafeMenu extends StatefulWidget {
  const CafeMenu({super.key});
  @override
  State<CafeMenu> createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
  List<Map<String, dynamic>> _menuList = [];
  final List<String> tabTitle = ['M', "T", 'W', 'T', 'F', 'S', 'S'];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _fetchMenu() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('cafe').get();
      _menuList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: tabTitle.length,
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
          bottom: TabBar(
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
        body: FutureBuilder(
          future: _fetchMenu(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return TabBarView(
                children: [
                  for (var menu in _menuList)
                    TabContent(
                      breakfast: menu['breakfast'],
                      lunch: menu['lunch'],
                      dinner: menu['dinner'],
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final Map<String, dynamic> breakfast;
  final Map<String, dynamic> lunch;
  final Map<String, dynamic> dinner;

  const TabContent({
    super.key,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> noOfMeal = [breakfast, lunch, dinner];
    return Center(
      child: ListView(children: [
        for (var meal in noOfMeal)
          Container(
            decoration:  BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey.shade400, width: 1),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(meal['value'] ?? "", style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 16),
                Image.network(
                  meal['image'] ?? "",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                        Icons.error); // Placeholder for failed image
                  },
                ),
                const SizedBox(height: 16),
                Text(meal['name'] ?? "", style: const TextStyle(fontSize: 18)),
              ],
            ),
          )
      ]),
    );
  }
}
