import 'package:flutter/material.dart';
import '../screens/category_select_screen.dart';
import '../screens/home_screen.dart';
import '../widgets/menu_drawer.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom-bar';

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    CategorySelectScreen(),
    Text('Result'),
    MenuDrawer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _pageOptions[_selectedPage],
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white54,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (int index) {
          index == 3
              ? _scaffoldKey.currentState.openDrawer()
              : setState(() {
                  _selectedPage = index;
                });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Category'),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text('Result'),
            icon: Icon(Icons.score),
          ),
          BottomNavigationBarItem(
            title: Text('Menu'),
            icon: Icon(Icons.menu),
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
