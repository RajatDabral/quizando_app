import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories with ChangeNotifier {
  final int id;
  final String name;
  final String imageUrl;

  Categories({this.id, this.name, this.imageUrl});

  List<String> categoryImages = [
    "https://st2.depositphotos.com/6628792/9844/v/950/depositphotos_98443756-stock-illustration-knowledge-theme-icon.jpg",
    "https://cdn.pixabay.com/photo/2016/09/10/17/18/book-1659717_960_720.jpg",
    "https://cdn.pixabay.com/photo/2013/11/28/10/02/photo-camera-219958_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/03/16/23/55/flea-market-1262036_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/11/07/20/48/cinema-4609877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/21/12/10/tv-1844964_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/06/29/10/28/games-2453777_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/07/07/16/46/roll-the-dice-1502706_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/11/27/21/31/computer-2982270_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/07/28/04/31/math-1547018_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/04/20/20/42/mermaid-2246943_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/08/24/21/41/tartan-track-2678544_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/03/09/11/56/globes-1246245_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/08/13/00/16/stonehenge-1590047_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/05/31/23/01/politics-2361943_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/03/12/13/41/beaded-2137080_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/11/24/10/43/admission-2974645_960_720.jpg",
    "https://cdn.pixabay.com/photo/2018/01/22/14/13/animal-3099035_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/05/28/23/12/auto-788747_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/04/09/16/40/batman-2216148_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/05/03/00/46/gadgets-336635_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/05/20/14/45/young-4216808_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/10/31/17/41/dancing-dave-minion-510835_960_720.jpg",
  ];

  List<Categories> _categoryItems = [];

  Future<void> getCategories() async {
    const url = "https://opentdb.com/api_category.php";
    final response = await http.get(url);
    final category =
        json.decode(response.body)['trivia_categories'] as List<dynamic>;

    for (int i = 0; i < category.length; i++) {
      _categoryItems.add(
        Categories(
          id: category[i]['id'],
          name: category[i]['name'],
          imageUrl: categoryImages[i],
        ),
      );
    }
    notifyListeners();
  }

  List<Categories> get categoryItems {
    return [..._categoryItems];
  }
}
