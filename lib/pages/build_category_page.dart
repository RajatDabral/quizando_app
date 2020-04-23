import 'package:flutter/material.dart';
import '../providers/categories.dart';
import 'package:provider/provider.dart';

class BuildCategoryPage {
  final BuildContext context;
  final int id;

  BuildCategoryPage({this.context, this.id});

  Widget buildCatPage() {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    final _currentCatItem =
        catProvider.firstWhere((catItem) => catItem.id == id);
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(40.0),
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
              Container(
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      _currentCatItem.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
