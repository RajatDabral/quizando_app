import 'package:flutter/material.dart';
import './screens/category_select_screen.dart';
import './providers/categories.dart';
import 'package:provider/provider.dart';

import './screens/loading_screen.dart';
import './providers/quiz_provider.dart';

void main() => runApp(QuizandoApp());

final appBarColor = Color(0xFF8B4BAF);

class QuizandoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Personality App",
        home: LoadingScreen(),
        routes: {
          CategorySelectScreen.routeName: (ctx) => CategorySelectScreen(),
        },
      ),
    );
  }
}
