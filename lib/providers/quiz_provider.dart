import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Difficulty { Easy, Medium, Hard }

class QuizProvider with ChangeNotifier {
   String diff;
   int id;

  void selectDifficulty(Difficulty d, int id) {
    if (d == Difficulty.Easy) diff = "easy";
    if (d == Difficulty.Medium) diff = "medium";
    if (d == Difficulty.Hard) diff = "hard";
    print(diff);  //testing
    this.id = id;
    print(this.id);
  }

  Future<void> getData() async {
    // const url = "https://opentdb.com/api.php?amount=10";
    // const url = "https://opentdb.com/api_category.php";
    try {
      final url =
          "https://opentdb.com/api.php?amount=10&category=$id&difficulty=$diff&type=multiple";
      final response = await http.get(url);
      final data = json.decode(response.body);
      print(data);
    } catch (e) {
      throw e;
    }
  }
}
