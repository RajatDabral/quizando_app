import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class QuizProvider with ChangeNotifier {
  Future<void> getData() async {
    // const url = "https://opentdb.com/api.php?amount=10";
    // const url = "https://opentdb.com/api_category.php";
    const url = "https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple";
    final response = await http.get(url);
    final data = json.decode(response.body);
    print(data);
  }
}
