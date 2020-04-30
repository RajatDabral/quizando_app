import 'package:flutter/material.dart';
import '../tiles/category_tile.dart';

import '../providers/categories.dart';
import 'package:provider/provider.dart';

class CategorySelectScreen extends StatelessWidget {
  static const routeName = '/category-screen';

  @override
  Widget build(BuildContext context) {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    return Scaffold(
      appBar: AppBar(
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
