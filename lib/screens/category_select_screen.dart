import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:personality_app/tiles/category_tile.dart';

import '../providers/categories.dart';
import 'package:provider/provider.dart';

class CategorySelectScreen extends StatelessWidget {
  static const routeName = '/category-screen';

  @override
  Widget build(BuildContext context) {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8B4BAF),
            Color(0xFF914EE5),
            Color(0xFF3A9ECD),
            Color(0xFFE36AE1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
        elevation: 10,
        title: Text("Categories"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Hero(
        tag: 'imageHero',
        child: GridView.builder(
          itemCount: catProvider.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) => CategoryTile(
            id: catProvider[index].id,
          ),
        ),
      ),
    );
  }
}
