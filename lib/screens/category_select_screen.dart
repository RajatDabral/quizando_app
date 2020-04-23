import 'package:flutter/material.dart';

import '../providers/categories.dart';
import 'package:provider/provider.dart';

class CategorySelectScreen extends StatelessWidget {
  static const routeName = '/category-screen';

  Widget buildPage(BuildContext ctx, String name, String url) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(ctx).size.height * .95,
            width: MediaQuery.of(ctx).size.width * .98,
            // color: Colors.yellow,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  url,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(name),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final catProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: PageView.builder(
        itemCount: catProvider.length,
        itemBuilder: (ctx, index) => buildPage(
            context, catProvider[index].name, catProvider[index].imageUrl),
      ),
    );
  }
}
