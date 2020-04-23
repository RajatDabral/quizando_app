import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories with ChangeNotifier {
  final int id;
  final String name;

  Categories({this.id, this.name});

  List<Categories> _categoryItems = [];

  Future<void> getCategories() async {
    const url = "https://opentdb.com/api_category.php";
    final response = await http.get(url);
    final category = json.decode(response.body)['trivia_categories']
        as List<dynamic>;

    for (int i = 0; i < category.length; i++) {
      _categoryItems.add(
        Categories(
          id: category[i]['id'],
          name: category[i]['name'],
        ),
      );
    }
    notifyListeners();
  }

  List<Categories> get categoryItems {
    return [..._categoryItems];
  }
}
