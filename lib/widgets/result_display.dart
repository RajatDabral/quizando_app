import 'package:flutter/material.dart';

import '../tiles/result_tile.dart';

class ResultDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Text Recommended
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: _screenHeight * .3,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // color: appBarColor,
            // color: Colors.white,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ResultTile(),
              ResultTile(),
              ResultTile(),
              ResultTile(),
            ],
          ),
        ),
      ],
    );
  }
}
