import 'package:flutter/material.dart';
import '../providers/categories.dart';
import 'package:personality_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setUpData() async {
    // final checkProvider = Provider.of<QuizProvider>(context, listen: false);
    // await checkProvider.getData();

    final categoryProvider = Provider.of<Categories>(context, listen: false);
    await categoryProvider.getCategories();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    setUpData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121215),
      //  appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitCubeGrid(
                color: Color(0xFFDEB609),
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "गरुड़",
                style: TextStyle(
                  color: Color(0xFFDEB609),
                  fontSize: 40.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
