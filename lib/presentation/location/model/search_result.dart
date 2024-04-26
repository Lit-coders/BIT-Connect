import 'package:flutter/material.dart';

class Search extends ChangeNotifier {
  List<Map<String, dynamic>> searchResults = [];
  String query = "";

  void updateSearchResults(List<Map<String, dynamic>> results) {
    searchResults = results;
    notifyListeners();
  }

  void updateQuery(String q) {
    query = q;
    notifyListeners();
  }

  void deleteHistory(String name) {
    final filteredHis =
        searchResults.where((place) => place['name'] != name).toList();
    searchResults = filteredHis;
    notifyListeners();
  }
}
