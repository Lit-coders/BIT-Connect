import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class QuickSearch {
  List<Map<String, dynamic>>? searchResults;
  static final fieldController = TextEditingController();

  static searchOnChange(query) {
    final result = searchFor(query);
    print(result.length);
  }

  static Future<dynamic> showQuickSearchWindow(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search places, facilities, ...'),
          content: Column(
            children: [
              TextField(
                controller: fieldController,
                onChanged: searchOnChange,
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
            ],
          ),
        );
      },
    );
  }
}
