import 'package:flutter/material.dart';
import '../tiles/category_tile.dart';

import '../widgets/bottom_bar.dart';

import '../providers/categories.dart';
import 'package:provider/provider.dart';

class CategorySelectScreen extends StatelessWidget {
  static const routeName = '/category-screen';

  @override
  Widget build(BuildContext context) {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "Categories",
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).iconTheme.color,
          iconSize: Theme.of(context).iconTheme.size,
          onPressed: () =>
              Navigator.popAndPushNamed(context, BottomBar.routeName),
        ),
      ),
      body: Hero(
        tag: 'imageHero',
        child: Container(
          margin: EdgeInsets.all(8.0),
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
      ),
    );
  }
}
