import 'package:bit_connect/presentation/location/model/search_result.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuickSearch {
  static final fieldController = TextEditingController();

  static Widget resultTab(place, context) {
    return Container(
      width: getWidth(context),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: ColorAssets.bduColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              place['name'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Icon(
              Icons.map_outlined,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  static Future<dynamic> showQuickSearchWindow(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Search places, facilities, ...',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      final result = searchFor(query);
                      Search search =
                          Provider.of<Search>(context, listen: false);
                      search.updateSearchResults(result);
                    }
                  },
                  autofocus: true,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(25, 0, 0, 0),
                    hintText: 'Search here ...',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(100, 0, 0, 0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
                const Text('search results for ...'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<Search>(builder: (context, search, child) {
                    return Column(
                      children: search.searchResults
                          .map((place) => resultTab(place, context))
                          .toList(),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
