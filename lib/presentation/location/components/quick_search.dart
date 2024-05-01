import 'package:bit_connect/presentation/location/components/bit_map.dart';
import 'package:bit_connect/presentation/location/model/search_result.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuickSearch {
  static final fieldController = TextEditingController();

  static Widget resultTab(place, context, Search search) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BitMap(place: place)));
      },
      child: Container(
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
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: search.query.isNotEmpty
                  ? const Icon(
                      Icons.map_outlined,
                      color: Colors.white70,
                    )
                  : InkWell(
                      onTap: () {
                        search.deleteHistory(place['name']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: ColorAssets.bduColor,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  static Widget searchResult() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<Search>(builder: (context, search, child) {
        if (search.searchResults.isEmpty && search.query.isNotEmpty) {
          return const Center(
            child: Text(
              "No Such Place Found, Search Again",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          );
        }

        return Column(
          children: search.searchResults
              .map((place) => resultTab(place, context, search))
              .toList(),
        );
      }),
    );
  }

  static Future<dynamic> showQuickSearchWindow(context) async {
    Search search = Provider.of<Search>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Search places, facilities, ...',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (query) {
                    search.updateQuery(query);
                    if (query.isNotEmpty) {
                      final result = searchFor(query);
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
                    hintText: 'Search Here ...',
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
                const Text('Search Results', style: TextStyle(
                    fontFamily: 'Poppins',
                  ),),
                searchResult(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Poppins',
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
