import 'package:flutter/material.dart';
import 'package:personality_app/widgets/categories_display.dart';
import '../widgets/result_display.dart';

import '../widgets/menu_drawer.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Center(
            child: Text(
              'Quizando',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10,
                right: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "My Results",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ResultDisplay(),
            SizedBox(
              height: 10,
            ),
            CategoriesDisplay(),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              // color: Colors.green,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.redeem,
                          size: 50,
                        ),
                        Text("Reward Points"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
