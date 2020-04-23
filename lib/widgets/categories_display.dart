import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/category_select_screen.dart';
import '../providers/categories.dart';

class CategoriesDisplay extends StatelessWidget {
  final int _gridLength = 6;

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
          height: MediaQuery.of(context).size.height * .55,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(10),

            //TODO EDIT SHADOW
          ),
          child: GridView.builder(
            itemCount: _gridLength,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, index) => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                    blurRadius: 4.0,
                  )
                ],
                image: DecorationImage(
                  image: NetworkImage(
                    categoryProvider[index].imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  categoryProvider[index].name,
                ),
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
          onTap: () {
            Navigator.of(context).pushNamed(CategorySelectScreen.routeName);
          },
        )
      ],
    );
  }
}
