import 'package:flutter/material.dart';
import '../providers/quiz_provider.dart';
import '../providers/categories.dart';
import 'package:provider/provider.dart';

class BuildCategoryPage {
  final BuildContext context;
  final int id;

  BuildCategoryPage({this.context, this.id});

  Widget raisedButton(String text, Difficulty d, int id) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    return RaisedButton(
      onPressed: () {
        quizProvider.selectDifficulty(d, id);
      },
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget buildCatPage() {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;

    final _currentCatItem =
        catProvider.firstWhere((catItem) => catItem.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentCatItem.name),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8B4BAF),
              Color(0xFF914EE5),
              Color(0xFF3A9ECD),
              Color(0xFFE36AE1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'imageHero',
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 8),
                height: MediaQuery.of(context).size.height * .40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      _currentCatItem.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "How much can you take it",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        raisedButton(
                            'NOOB', Difficulty.Easy, _currentCatItem.id),
                        raisedButton(
                            'PRO', Difficulty.Medium, _currentCatItem.id),
                        raisedButton(
                            'MASTER', Difficulty.Hard, _currentCatItem.id),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
