import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/categories.dart';
import 'package:personality_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<TextStyle> _animation;

  void setUpData() async {
    // final checkProvider = Provider.of<QuizProvider>(context, listen: false);
    // await checkProvider.getData();

    await _controller.forward();

    ///Waiting for animation to complete.
    final categoryProvider = Provider.of<Categories>(context, listen: false);
    await categoryProvider.getCategories();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
  }

  int colorInd = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    _animation = TextStyleTween(
        begin: TextStyle(
          fontSize: 0,
        ),
        end: TextStyle(
          fontSize: 40,
        )).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    setUpData();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitCubeGrid(
                color: Theme.of(context).accentColor,
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "गरुड़",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: _animation.value.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
