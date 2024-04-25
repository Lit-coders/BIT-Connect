import 'package:flutter/material.dart';

class Search extends ChangeNotifier {
  List<Map<String, dynamic>> searchResults = [];
  String query = "";

  void updateSearchResults(List<Map<String, dynamic>> results) {
    searchResults = results;
    notifyListeners();
  }

  void setQuery(query) {
    query = query;
    notifyListeners();
  }
}
