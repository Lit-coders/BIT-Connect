import 'package:bit_connect/presentation/location/model/search_result.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuickSearch {
  static final fieldController = TextEditingController();

  static Future<dynamic> showQuickSearchWindow(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search places, facilities, ...'),
          content: Column(
            children: [
              TextField(
                onChanged: (query) {
                  final result = searchFor(query);
                  Search search = Provider.of<Search>(context, listen: false);
                  search.updateSearchResults(result);
                },
                autofocus: true,
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(25, 0, 0, 0),
                  hintText: 'Search Places ...',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(163, 0, 0, 0),
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
                        .map((place) => Text(place['name']))
                        .toList(),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
