import 'package:flutter/material.dart';
import 'package:personality_app/widgets/categories_display.dart';
import 'package:personality_app/widgets/result_display.dart';

import '../widgets/menu_drawer.dart';

class HomeScreen extends StatelessWidget {
  ///using global key for Opening Drawer.
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    final divHeight = (MediaQuery.of(context).size.height / 2) * .60;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                ),
                color: Theme.of(context).iconTheme.color,
                iconSize: Theme.of(context).iconTheme.size,
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              centerTitle: true,
              title: Text(
                'Quizando',
                style: Theme.of(context).textTheme.headline4,
              ),
              floating: true,
              pinned: true,
              expandedHeight: divHeight,
              stretch: true,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(divHeight),
                  bottomRight: Radius.circular(divHeight),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Center(child: Text('Hello')),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ResultDisplay(),
                  SizedBox(
                    height: 20,
                  ),
                  CategoriesDisplay(),
                ],
              ),
            ),
          ],
        ),
        drawer: MenuDrawer(),
      ),
    );
  }
}


// ----------------------

// appBar: PreferredSize(
//   preferredSize: Size.fromHeight(divHeight),
//   child: Container(
//     decoration: BoxDecoration(
//       color: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(divHeight * .8),
//         bottomRight: Radius.circular(divHeight * .8),
//       ),
//     ),
//     child: Column(children: <Widget>[
//       Row(
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.menu,),
//             color: Theme.of(context).iconTheme.color,
//             iconSize: Theme.of(context).iconTheme.size,
//             onPressed: () {
//               _scaffoldKey.currentState.openDrawer();
//             },
//           )
//         ],
//       ),
//       Center(
//         child: Text(
//           'Quizando',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ),
//     ]),
//   ),
// ),
// body: SingleChildScrollView(
//   child: Column(
//     children: <Widget>[
//       Center(child: Text('Hello'))
//     ],
//   ),
// ),
