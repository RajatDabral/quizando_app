import 'package:flutter/material.dart';
import 'package:personality_app/pages/build_category_page.dart';
import 'package:personality_app/providers/categories.dart';
import 'package:provider/provider.dart';

class CategoryTile extends StatelessWidget {
  final int id;

  CategoryTile({this.id});

  @override
  Widget build(BuildContext context) {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    final currentCategory =
        catProvider.firstWhere((catItem) => catItem.id == id);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) =>
              BuildCategoryPage(id: currentCategory.id, context: ctx)
                  .buildCatPage(),
        ));
      },
      child: GridTile(
        child: Image.network(
          currentCategory.imageUrl,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black26,
          title: Text(
            currentCategory.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
