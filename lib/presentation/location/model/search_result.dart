import 'package:flutter/material.dart';

class Search extends ChangeNotifier {
  List<Map<String, dynamic>> searchResults = [];

  void updateSearchResults(List<Map<String, dynamic>> results) {
    searchResults = results;
    notifyListeners();
  }
}
