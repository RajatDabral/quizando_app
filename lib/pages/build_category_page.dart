import 'package:flutter/material.dart';
import '../providers/quiz_provider.dart';
import '../providers/categories.dart';
import 'package:provider/provider.dart';

class BuildCategoryPage {
  final BuildContext context;
  final int id;

  BuildCategoryPage({this.context, this.id});

  ///Building Raised Button for levels
  Widget raisedButton(String text, Difficulty d, int id) {
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: RaisedButton(
        color: Color(0xff401D66),
        textColor: Theme.of(context).accentColor,
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
      ),
    );
  }

  ///Building acutual Page for Each Category.
  ///
  Widget buildCatPage() {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;

    final _currentCatItem =
        catProvider.firstWhere((catItem) => catItem.id == id);
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          _currentCatItem.name,
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).iconTheme.color,
          iconSize: Theme.of(context).iconTheme.size,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: 'imageHero',
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 8),
              height: _screenHeight * .40,
              width: _screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    _currentCatItem.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  "How much can you take it?",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      raisedButton('NOOB', Difficulty.Easy, _currentCatItem.id),
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
    );
  }
}
