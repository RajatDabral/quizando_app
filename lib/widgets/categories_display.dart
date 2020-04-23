import 'package:flutter/material.dart';

import '../providers/categories.dart';
import 'package:provider/provider.dart';

class CategoriesDisplay extends StatelessWidget {
  final int _gridLength = 4;

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<Categories>(context, listen: false).categoryItems;
    return Column(
      children: <Widget>[
        Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 400,
          // color: Colors.red,
          child: GridView.builder(
            itemCount: _gridLength,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, index) => Container(
              height: 200,
              color: Colors.yellow,
              child: Text(
                categoryProvider[index].name,
              ),
            ),
          ),
        ),
        SizedBox( 
          height: 10.0,
        ),
        GestureDetector(
          child: Text(
            "See all",
            style: TextStyle(fontSize: 20.0),
          ),
          onTap: () {},
        )
      ],
    );
  }
}
