import 'package:flutter/material.dart';

class BuildCategoryPage {
  final BuildContext context;
  final String name;
  final String url;

  BuildCategoryPage({this.context, this.name, this.url});

  Widget buildCatPage() {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .95,
            width: MediaQuery.of(context).size.width * .98,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  url,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(name),
          ),
        ),
      ),
    );
  }
}
