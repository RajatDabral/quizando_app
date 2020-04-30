import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';

class HomeScreen extends StatelessWidget {
  ///using global key for Opening Drawer.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    final divHeight = (MediaQuery.of(context).size.height / 2) * .60;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(divHeight),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(divHeight * .8),
                bottomRight: Radius.circular(divHeight * .8),
              ),
            ),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu,),
                    color: Theme.of(context).iconTheme.color,
                    iconSize: Theme.of(context).iconTheme.size,
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  )
                ],
              ),
              Center(
                child: Text(
                  'Quizando',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ]),
          ),
        ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(child: Text('Hello'))
            ],
          ),
        ),
      ),
    );
  }
}
