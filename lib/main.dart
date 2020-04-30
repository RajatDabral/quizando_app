import 'package:flutter/material.dart';
import './screens/category_select_screen.dart';
import './providers/categories.dart';
import 'package:provider/provider.dart';

import './screens/loading_screen.dart';
import './providers/quiz_provider.dart';

void main() => runApp(QuizandoApp());

final primaryColor = Color(0xFF5F4B8BFF);
final secondaryColor = Color(0xFFE69A8DFF);

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
        title: 'Quizando',
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          primaryColor: primaryColor,
          accentColor: secondaryColor,
        ),
        home: LoadingScreen(),
        routes: {
          CategorySelectScreen.routeName: (ctx) => CategorySelectScreen(),
        },
      ),
    );
  }
}
