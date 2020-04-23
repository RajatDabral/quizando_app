import 'package:flutter/material.dart';

class CategoriesDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: GridView.count(
            padding: EdgeInsets.all(10),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: <Widget>[
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.black,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "See all",
          style: TextStyle(fontSize: 20.0),
        )
      ],
    );
  }
}
